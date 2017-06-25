# Welcome to MyBank

MyBank is a banking account system that helps customers manage their bank balance. With a simple web interface, the customer can easily check his account balance and make transfers to other customers.

**Get Current Balance.** Input your MyBank account code and the system validates your data and displays your MyBank balance.

**Transfer Money.**  Input your MyBank account code, the destination MyBank account code and the desired amount and the system does the transfer online. Please, pay attention to informe a valid account and to have enough money at your account.

## Table of Contents

* [Installation](#installation)
* [How It Works](#how-it-works)
	* [Get Current Balance](#get-current-balance)
	* [Transfer Money](#get-current-balance)
* [Testing with RSpec](#testing-with-rspec)

## Installation

**Dependention note**: MyBank requires the MongoDB is instaled and up.

1. Clone the project.

	~~~ sh
	$ git clone https://github.com/cleicar/my-bank.git
	~~~

2. Bundle the Gems.

	~~~ sh
	$ bundle install
	~~~

3. Install bower dependencies

	~~~ sh
	$ bower install
	~~~

4. Set the database connection at the config file `config/mongoid.yml`.

5. Start the application

	~~~ sh
	$ rails s
	~~~

## How It Works

### Get Current Balance

To see the account balance the user needs to input the account code. The system check the database account and displays the balance on the same page.

If the account does'nt exists a warning message will be displayed.

### Transfer Money

To transfer money to other customer, first the user needs to input his own account code. The system will validate the account on the database. If the account doesn't exists, a warning message will be displayed.

If the user account exists, his name will be showed and he can proceed. Input the destination account and the desired amount to transfer, then trigger button `send`.

If destination account exists and the source account has enough balance, the money will be credited to the destination user and debited from source account. If destination account does not exists or user does'nt have enough money, a warning message will be displayed.

The datetime of transaction is also saved.

## Testing with RSpec

The project was build with TDD (Test Driven Development). To execute the tests just run the tests with RSpec.

	~~~ sh
	$ bundle exec rspec
	~~~

To see the test cover percent open the file `coverage/index.html` at your browser.