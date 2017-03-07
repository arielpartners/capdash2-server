# CucumberJS step definitions for healthcheck feature test

Given(/^the capdash system is running$/) do
  Rails.application.initialized?
end

When(/^I navigate to the url \/healthcheck$/) do
  get '/healthcheck'
end

Then(/^I should receive the HTTP response$/) do |response_table|
  data = response_table.rows_hash
  expect(last_response.status).to eq(data['status'].to_i)
end
