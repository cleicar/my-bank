require 'rails_helper'

RSpec.describe AccountController, type: :controller do

  let(:client_user){
    FactoryGirl.create(:user)
  }

  describe 'Testing routes' do
    it 'should recognizes get #get_balance' do
      expect({ get: get_balance_account_index_path}).to route_to(controller: "account", action: "get_balance")
    end
  end

  describe 'Getting balance' do 
    before do
      account      = FactoryGirl.create(:account, account_code: '988877')
      account.user = client_user
      account.save!
    end

    it 'should save the new transaction' do 
      get :get_balance, account_code: '988877'

      response_body = JSON.parse(response.body).with_indifferent_access

      expect(response_body[:account]).to_not be_nil

      account = response_body[:account]

      expect(account[:balance]).to eq 1300.00
      expect(account[:account_code]).to eq '988877'
      expect(response_body[:client_name]).to eq 'Test User'
    end
  end

end
