class TransactionController < ApplicationController
  respond_to :json

  def new
  end

  def create
    debugger

    return_message = "Transferência realizada com sucesso!"

    source_account      = Account.where(account_id: params[:source_account]).first
    destination_account = Account.where(account_id: params[:destination_account]).first

    if source_account.present?

    else
      return_message = "Conta destino não existe."
    end

    render status: 404, json: { message: "Usuário não encontrado." }
  end

end
