# CucumberJS step definitions for healthcheck feature test

Given(/^the capdash system is running$/) do
  Rails.application.initialized?
end

Given(/^StatsD is running$/) do
  StatsD.present? && File.open('log/statsd.log', 'w+').close
end

When(/^I navigate to the url (.*)$/) do |url|
  get url
end

Then(/^I should see the log '(.*?)'$/) do |expected_message|
  statsd_log =  File.readlines('log/statsd.log')
  last_log = statsd_log.last
  message = last_log.split(" ").last
  expect(message).to eq(expected_message)
end
