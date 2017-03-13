# Capdash 2

Ruby on Rails 5 API

## Dependencies

  * PostgreSQL: See main README for instructions on setting up postgres (using Docker)

## Build

  * Run `bundle install` to install gem dependencies
  * Run `rails db:setup` and `rails db:migrate` to create and set up database

## Development server

  * Run `rails server`, navigate to `localhost:3000`
  * Run `rails routes` to view endpoints

## Running tests

  * Server must be running
  * Run `rails cucumber` to run cucumber tests
  * Run `rails cucumber:html` to print report of cucumber tests to `reports/feature/results/index.html`
  * After running tests, code coverage report can be found at `reports/feature/coverage/index.html`

## Security testing

  * Run `brakeman` for brakeman security testing, including some OWASP top 10 issues including XSS and SQL injection.
    * `brakeman -o reports/security/brakeman.html` to save a report
  * For details about Ruby on Rails security, see [OWASP Rails Security](https://www.owasp.org/images/8/89/Rails_Security_2.pdf). Brakeman covers much of this, and more automated security testing will be added according to the guidance found there.
