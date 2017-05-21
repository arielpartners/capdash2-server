# Capdash 2

Ruby on Rails 5 API

## Major Technologies used

  * [PosgreSQL](https://www.postgresql.org/) Open-source object-relational database
  * [knock](https://github.com/nsarno/knock) Gem for [jwt](https://jwt.io/)-based authentication
  * [Rubocop](https://github.com/bbatsov/rubocop) static code analyzer based on the Ruby style guide
  * [Brakeman](https://github.com/presidentbeef/brakeman) open source static analysis tool which checks Ruby on Rails applications for security vulnerabilities
  * [cucumber-rails](https://github.com/cucumber/cucumber-rails) Cucumber implementation for ruby on rails
  * [rspec](http://rspec.info/) Testing framework for unit tests
  * [statsd-instrument](https://github.com/Shopify/statsd-instrument) StatsD client for Ruby apps


## Dependencies

  * PostgreSQL: See main README for instructions on setting up postgres (using Docker)
  * If you have completed pre-reqs, then you should only need to do: `docker start postgres`

## Build

  * Run `bundle install` to install gem dependencies
  * Run `rails db:setup` and `rails db:migrate` to create and set up database

## Development server

  * Run `rails server`, navigate to `localhost:3000`
  * Run `rails routes` to view endpoints

## Running tests

### Unit tests
  * Run `rspec` for unit testing
  * Run `rake spec` to save unit test report to `reports/unit_tests/rspec_results.html`
  
### Feature tests
  * Run `rails cucumber` to run cucumber tests
  * Run `rails cucumber:html` to print report of cucumber tests to `reports/feature/results/index.html`
  * After running tests, code coverage report can be found at `reports/feature/coverage/index.html`

## Security testing

  * Run `brakeman` for brakeman security testing, including some OWASP top 10 issues including XSS and SQL injection.
    * `brakeman -o reports/security/brakeman.html` to save a report
  * For details about Ruby on Rails security, see [OWASP Rails Security](https://www.owasp.org/images/8/89/Rails_Security_2.pdf). Brakeman covers much of this, and more automated security testing will be added according to the guidance found there.

## Logging and Monitoring

Logs for each environment can be found in [`log/`](./log/)
Example of production log:
```
D, [2017-03-15T16:02:33.413314 #57302] DEBUG -- :   [1m[36mUser Load (1.8ms)[0m  [1m[34mSELECT  "users".* FROM "users" WHERE "users"."email" = $1 LIMIT $2[0m  [["email", "sample_user@dhs.nyc.gov"], ["LIMIT", 1]]
I, [2017-03-15T16:02:33.560639 #57302]  INFO -- : method=POST path=/user_token format=*/* controller=UserTokenController action=create status=201 duration=183.07 view=0.90 db=15.02 params={"auth"=>{"email"=>"sample_user@dhs.nyc.gov", "password"=>"[FILTERED]"}, "user_token"=>{"auth"=>{"email"=>"sample_user@dhs.nyc.gov", "password"=>"[FILTERED]"}}} ip=::1
```
StatsD is used for Application Performance Monitoring (APM). In production, `statsd-instrument` will send UDP packets to our StatsD daemon. In development, StatD measurements are simply logged.
Example of development log with statsd:
```
[StatsD] increment User.login.success:1
method=POST path=/user_token format=*/* controller=UserTokenController action=create status=201 duration=169.37 view=0.50 db=11.83 params={"auth"=>{"email"=>"sample_user@dhs.nyc.gov", "password"=>"[FILTERED]"}, "user_token"=>{"auth"=>{"email"=>"sample_user@dhs.nyc.gov", "password"=>"[FILTERED]"}}} ip=::1
```
Log level is set to `debug` in all environments by default, but can be configured in `config/environments/` files to the desired level (`debug`, `info`, `warn`, `error`, `fatal`, `unknown`)
