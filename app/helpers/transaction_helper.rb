module TransactionHelper

	def get_account_by_code(code)
		Account.where(account_code: code).first
	end

	def transfer_money(source_account, destination_account, amount)
    up_destination = destination_account.update_attributes(balance: destination_account.balance + amount.to_f)
    up_source      = source_account.update_attributes(balance: source_account.balance - amount.to_f)

    transfer_success = up_destination && up_source

    json_response = {}
    json_response[:success] = transfer_success
    json_response[:message] = 'Transferencia realizada com sucesso' if transfer_success

    return json_response
  end

end
