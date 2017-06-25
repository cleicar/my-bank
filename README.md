# Welcome to MyBank

MyBank is a banking account system that helps customers manage their bank balance. With a simple web interface, the customer can easily check his account balance and make transfers to other customers.

** Get Current Balance.** Input your MyBank account code and the system validates your data and displays your MyBank balance.

** Transfer Money.**  Input your MyBank account code, the destination MyBank account code and the desired amount and the system does the transfer online. Please, pay attention to informe a valid account and to have enough money at your account.

## Table of Contents

* [Installation](#installation)

## Installation

**Dependention note**: MyBank requires the MongoDB is instaled and up.

1. Clone the project.

	~~~ sh
	$ https://github.com/cleicar/my-bank.git
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