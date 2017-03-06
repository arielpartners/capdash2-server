Given(/^the capdash system is running$/) do
  Rails.application.initialized?
end

When(/^I navigate to the url \/healthcheck$/) do
  get '/healthcheck'
end

Then(/^I should receive the repsonse (\d+) No Content$/) do |code|
  expect(last_response.status).to eq(code.to_i)
end
