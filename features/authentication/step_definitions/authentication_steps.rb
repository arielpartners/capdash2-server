Given(/^The following user exists in the system$/) do |table|
  user = table.hashes[0]
  User.create!(email: user['email'], password: user['password'])
end

When(/^I login as the following user$/) do |table|
  user = table.hashes[0]
  body = { auth: { email: user['email'], password: user['password'] }}
  post '/user_token', body
end
