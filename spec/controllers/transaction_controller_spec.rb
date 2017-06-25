require 'rails_helper'

RSpec.describe TransactionController, type: :controller do

	context 'Testing routes' do
		it 'should recognizes get #index' do
			expect({ get: transaction_index_path}).to route_to(controller: "transaction", action: "index")
		end

		it 'should recognizes get #create' do
			expect({ post: transaction_index_path}).to route_to(controller: "transaction", action: "create")
		end
  end

	  context "Testing adding new transaction" do 

		let(:source_client){
      FactoryGirl.create(:user)
    }

		let(:destination_client){
      FactoryGirl.create(:user_b)
    }

  	before do
			@params = {
				source_account: '0100427',
				destination_account: '89218921',
				date: Time.now.to_formatted_s(:db),
				amount: 100.00
			}

			account_a = FactoryGirl.create(:account_a)
			account_b = FactoryGirl.create(:account_b)

			source_client.update_attributes(account: account_a)
			destination_client.update_attributes(account: account_b)

			post :create, @params
		end

  	it 'should save the new transaction' do
			response_body = JSON.parse response.body
			expect(response_body["message"]).to eq 'Transferência realizada com sucesso!'
  	end

  	it 'destination account should have more balance' do
      destination_client.reload

      expect(destination_client.account.balance).to eq 1018.17
    end

    it 'source account should have less balance' do 
    	source_client.reload

      expect(source_client.account.balance).to eq 1231.29
    end

  end

end
