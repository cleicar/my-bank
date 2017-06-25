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
  	before do
			@params = {
				source_branch: '3998',
				source_account: '0100427',
				destination_branch: '3998',
				destination_account: '24876009',
				date: '24/06/2017',
				amount: 100.00
			}
		end

  	it 'should save the new transaction' do 
  		post :create, @params

			response_body = JSON.parse response.body
			expect(response_body["message"]).to eq 'Empresa adicionada com sucesso!'
  	end

  end

end
