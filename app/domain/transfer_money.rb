class TransferMoney

	attr_reader :source_account, :destination_account, :amount

	def initialize(source_account, destination_account, amount)
		@source_account 		 = source_account
		@destination_account = destination_account
		@amount 						 = amount
	end

	def transfer
		if source_account.balance <= amount
			false
		else
			update_destination && update_source && save_transfer
		end
	end

	private
	def update_destination
		destination_account.update_attributes(balance: destination_account.balance + amount.to_f)
	end

	def update_source
		source_account.update_attributes(balance: source_account.balance - amount.to_f)
	end

	def save_transfer
		Transaction.create(source_account_id: source_account.account_code, 
			destination_account_id: destination_account.account_code, amount: amount, date: Date.today)
	end
end