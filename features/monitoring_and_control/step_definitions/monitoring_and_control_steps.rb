# CucumberJS step definitions for healthcheck feature test

Given(/^the capdash system is running$/) do
  Rails.application.initialized?
end

Given(/^StatsD is running$/) do
  StatsD.present? &&
    @existing_log_count = File.readlines('log/statsd.log').count
end

When(/^I navigate to the url (.*)$/) do |url|
  get url
end

Then(/^I should see the log$/) do |table|
  expected_log = table.hashes[0]
  statsd_log = File.readlines('log/statsd.log')
  expect(statsd_log.count).to eq(@existing_log_count + 1)
  last_log = statsd_log[@existing_log_count]
  level = last_log.split(" ")[3]
  message = last_log.split(" ").last
  expect(level).to eq(expected_log['Level'])
  expect(message).to eq(expected_log['Message'])
end
