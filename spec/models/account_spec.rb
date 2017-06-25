require 'rails_helper'

RSpec.describe Account, type: :model do

  describe "Creating new account" do

  	let(:account){
    	FactoryGirl.create(:account_a)
  	}

  	let(:attributes){
    	{"account_code"=>"0100427", 
			"balance"=>1331.29}
  	}

		it "should have all account fields" do
			created_account = Account.where(id: account.id).first

			expect(created_account.attributes).to include :account_code
			expect(created_account.attributes).to include :balance

			created_account.attributes.delete("_id")

			expect(created_account.attributes).to eq attributes
		end
  end
  
  # TODO: Testar relacionamentos
end
