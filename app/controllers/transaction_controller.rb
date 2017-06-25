class TransactionController < ApplicationController
  include TransactionHelper

  respond_to :json

  def index
  end

  def create
    response = Hash.new
    response[:success] = false

    destination_account = get_account_by_code(params[:destination_account])

    if destination_account.present?
      source_account = get_account_by_code(params[:source_account])

      if source_account.balance < params[:amount].to_f
        response[:message] = "Saldo insuficiente."  
      else
        response = transfer_money(source_account, destination_account, params[:amount])
        response[:success] = true
        response[:message] = "Transferência realizada com sucesso!"
      end
    else
      response[:message] = "Conta destino não existe."
    end

    render status: 200, json: response
  end

end
