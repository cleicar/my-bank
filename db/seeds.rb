# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

case Rails.env

when 'development'
	new_user_a = User.find_or_initialize_by(registry: '89716543300', name: 'User Test')
	new_user_a.save!

	Account.create(user: new_user_a, balance: 1300.00, account_code: '90876004')

	new_user_b = User.find_or_initialize_by(registry: '01976544162', name: 'Other User Test')
	new_user_b.save!

	Account.create(user: new_user_b, balance: 900.00, account_code: '7700827')

when 'production'

end