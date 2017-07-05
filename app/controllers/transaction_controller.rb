require_relative '../domain/transfer_money'

class TransactionController < ApplicationController
  include TransactionHelper

  respond_to :json

  def index
    debts   = Transaction.where(source_account_id: params[:account]).all
    credits = Transaction.where(destination_account_id: params[:account]).all

    render status: 200, json: {debts: debts, credits: credits}
  end

  def create
    response = Hash.new
    response[:success] = false

    source_account      = Account.where(account_code: params[:source_account]).first
    destination_account = Account.where(account_code: params[:destination_account]).first

    transfer_obj = TransferMoney.new(source_account, destination_account, params[:amount].to_f)

    debugger

    if transfer_obj.transfer
      response[:success] = true
      response[:message] = 'Transferencia realizada com sucesso'
      status  = 200
    else
      response[:success] = false
      response[:message] = 'Ocorreu uma falha ao realizar essa transferencia'
      status = 406
    end

    render status: status, json: response
  end

end
