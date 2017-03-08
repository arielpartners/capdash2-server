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
  expected_response = response_table.rows_hash
  matchers = {
    '$hostname' => last_request.host,
    '$version' => /^(\d+\.)?(\d+\.)?(\d+)$/,
    '$env' => Rails.env
  }
  expected_response.each do |param, value|
    expected_response[param] = matchers[value] if matchers[value]
  end
  body = JSON.parse(last_response.body)
  expected_response.each do |param, value|
    if value.is_a? Regexp
      expect(body[param]).to match(value)
    else
      expect(body[param]).to eq(value)
    end
  end
end
