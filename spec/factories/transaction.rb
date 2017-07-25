FactoryGirl.define do
  factory :credit_transaction, class: 'Transaction' do
    source_account_id '12345678'
    destination_account_id '0100427'
    amount 100.50
    date Date.today
  end

  factory :debit_transaction, class: 'Transaction' do
    source_account_id '0100427'
    destination_account_id '12345678'
    amount 918.17
    date Date.today
  end
end
