FactoryGirl.define do
  factory :account_a, class: 'Account' do
    account_code '0100427'
    balance 1331.29
  end

  factory :account_b, class: 'Account' do
    account_code '89218921'
    balance 918.17
  end
end
