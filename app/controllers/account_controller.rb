class AccountController < ApplicationController
  respond_to :json

  def get_balance
    account = Account.where(account_code: params[:account_code]).first
    
    client_name = account.present? ? account.user.name : ""
    
    render status: 200, json: {account: account,  client_name: client_name}
  end

  def get_username
  	account = Account.where(account_code: params[:account_code]).first
    
    client_name = account.present? ? account.user.name : ""

    render status: 200, json: {user_name: client_name}
  end

end
