# CucumberJS step definitions for healthcheck feature test

Given(/^the capdash system is running$/) do
  Rails.application.initialized?
end

When(/^I navigate to the url (.*)$/) do |url|
  get url
end

Then(/^I should receive the HTTP response$/) do |http_response_table|
  data = http_response_table.rows_hash
  expect(last_response.status).to eq(data['status'].to_i)
end

Then(/^I should receive the response$/) do |response_table|
  pending
end