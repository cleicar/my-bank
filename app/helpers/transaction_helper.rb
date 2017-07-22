module TransactionHelper

	def get_account_by_code(code)
		Account.where(account_code: code).first
	end

end
