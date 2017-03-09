# CucumberJS step definitions for healthcheck feature test

Given(/^the capdash system is running$/) do
  Rails.application.initialized?
end

When(/^I navigate to the url (.*)$/) do |url|
  get url
end
