FactoryGirl.define do
  factory :user do
    name 'Test User'
    registry '37843349103'
    email 'example@example.com'
  end

  factory :user_b, class: 'User' do
    name 'Test User B'
    registry '00398276511'
    email 'example2@example.com'
  end
end
