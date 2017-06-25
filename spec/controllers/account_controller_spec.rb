require 'rails_helper'

RSpec.describe AccountController, type: :controller do

  context 'Testing routes' do
    it 'should recognizes get #get_balance' do
      expect({ get: get_balance_account_index_path}).to route_to(controller: "account", action: "get_balance")
    end

    it 'should recognizes get #get_username' do
      expect({ get: get_username_account_index_path}).to route_to(controller: "account", action: "get_username")
    end
  end

  context 'Testing actions' do 
    let(:client_user){
      FactoryGirl.create(:user)
    }

    before(:each) do
      account      = FactoryGirl.create(:account_a, account_code: '988877')
      account.user = client_user
      account.save!
    end

    describe 'Getting balance' do
      it 'should get the account balance' do 
        get :get_balance, account_code: '988877'

        response_body = JSON.parse(response.body).with_indifferent_access

        expect(response_body[:account]).to_not be_nil

        account = response_body[:account]

        expect(account[:balance]).to eq 1331.29
        expect(account[:account_code]).to eq '988877'
        expect(response_body[:client_name]).to eq 'Test User'
      end
    end

    describe 'Getting user name' do
      it 'should get the account user name' do 
        get :get_username, account_code: '988877'

        response_body = JSON.parse(response.body).with_indifferent_access

        expect(response_body[:user_name]).to eq 'Test User'
      end
    end
  end
end
