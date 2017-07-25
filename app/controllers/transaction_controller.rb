require_relative '../domain/transfer_money'

class TransactionController < ApplicationController
  include TransactionHelper

  respond_to :json

  def index
    account = Account.where(account_code: params[:account]).first

    if account.blank?
      message = 'Esta conta não existe.'
      status  = 001
    else
      debts    = Transaction.where(source_account_id: account.account_code).all
      credits  = Transaction.where(destination_account_id: account.account_code).all
      tranfers = debts.concat(credits)
      status   = 200
    end

    render status: 200, json: {status: status, message: message, transactions: tranfers}
  end

  def create
    response = Hash.new
    response[:success] = false

    source_account      = Account.where(account_code: params[:source_account]).first
    destination_account = Account.where(account_code: params[:destination_account]).first

    if destination_account.blank?
      response[:message] = 'Conta destino não existe.'
      status  = 001
    else
      transfer_obj = TransferMoney.new(source_account, destination_account, params[:amount].to_f)

      if transfer_obj.transfer
        response[:success] = true
        response[:message] = 'Transferencia realizada com sucesso'
        status  = 200
      else
        response[:success] = false
        response[:message] = 'Ocorreu uma falha ao realizar essa transferencia'
        status = 406
      end
    end

    render status: status, json: response
  end
end
