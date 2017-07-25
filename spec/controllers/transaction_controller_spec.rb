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
		end

		it 'should cancel transaction if destination account does not exists' do 
			@params[:destination_account] = '9999999'
			
			post :create, @params

			response_body = JSON.parse response.body
			expect(response_body["message"]).to eq 'Conta destino não existe.'
		end

		it 'should cancel transaction if required amount is more than source balance' do
			@params[:amount] = 2000.00
			
			post :create, @params

			response_body = JSON.parse response.body
			expect(response_body["message"]).to eq 'Ocorreu uma falha ao realizar essa transferencia'
		end

  	it 'should save the new transaction' do
  		post :create, @params

			response_body = JSON.parse response.body
			expect(response_body["message"]).to eq 'Transferencia realizada com sucesso'
  	end

  	it 'destination account should have more balance' do
  		post :create, @params

      destination_client.reload

      expect(destination_client.account.balance).to eq 1018.17
    end

    it 'source account should have less balance' do 
    	post :create, @params
    	
    	source_client.reload

      expect(source_client.account.balance).to eq 1231.29
    end
  end

  context "Listing transactions" do 
    let(:account){
      FactoryGirl.create(:account_a)
    }

    before do 
      FactoryGirl.create(:credit_transaction)
    end

		it 'should list one transaction' do
			get :index, account: account.account_code

			response_body = JSON.parse(response.body).with_indifferent_access

			expect(response_body[:transactions].count).to eq 1
		end

		it 'should return that account does not exist' do
			get :index, account: '0100427'

			response_body = JSON.parse response.body

			expect(response_body["message"]).to eq 'Esta conta não existe.'
		end

  end

end
