# README #

This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for? ###

* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up? ###

#### Rails ####

1. Get PostgresSQL, info can be [here](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-14-04)

2. Get RVM (unless you already got it), info in [here](https://rvm.io/rvm/install)

3. Install the correct Ruby version (currently 2.4.1) -> `rvm install ruby-2.4.1`

4. Install the Bundler gem -> `gem install bundler`

5. Install the other gems -> `bundle` OR `bundle install`

6. Setup the database.yml file (There's a guide -> `databse.yml.example` ).

7. Setup the .env file for sending emails from development on your local machine (There's a guide -> `.env.example`).

8. Setup the database -> `rake db:setup`

### Run the local server ####

14. Run the server -> `rails s`, this will start your local server at `localhost:3000/`

### Run tests: ###

1. `rake db:test:prepare`

2. `rspec`

3. Test coverage report can be found in `coverage/index.html`

#### Deploy instructions ####

Deploys will be manually handled by the project's tech lead.

### Contribution guidelines ###

* We use Rspec for writing tests, if unfamiliar with it, can find a guide [here](https://github.com/rspec/rspec-rails)

* Project uses HAML instead of the normal ERB/HTML based Rails templates, if unfamiliar with HAML you can find a guide [here](https://github.com/haml/haml)

* To handle JSON responses, this project uses the AMS gem, if unfamiliar with it, you can find a guide [here](https://github.com/rails-api/active_model_serializers)

* Before submitting pull requests for review, make sure to run `rubocop -a`, which will find code offenses, it will auto-fix some and point out the rest for you to fix. A guide of Rubocop use can be found [here](http://rubocop.readthedocs.io/en/latest/)

* To generate a visual guide of the database model run -> `erd`, a guide of the ERD gem can be found [here](https://github.com/voormedia/rails-erd)

### Who do I talk to? ###

* Repo owner or admin

* Other community or team contact
