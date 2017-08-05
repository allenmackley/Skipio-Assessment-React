# README

## Install steps
* `cd` to the project folder and run `bundle update` to install gems.
* run `rails db:setup` to create the databases as configured in config/database.yml and also to seed it.
* I'm using the mysql2 gem and port 8889.
* My development environment uses NGINX and Phusion Passenger
* Need to create a file called `skipio_token.txt` in the root of the project and put a staging token in there for it to work. The token was intentionally left out of the GIT repo.
