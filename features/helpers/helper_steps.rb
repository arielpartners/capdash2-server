Then(/^I should receive the following response$/) do |response_table|
  expected_response = response_table.rows_hash
  matchers = {
    '$hostname' => last_request.host,
    '$version' => /^(\d+\.)?(\d+\.)?(\d+)$/,
    '$env' => Rails.env,
    '$validJwtToken' =>
      /^[a-zA-Z0-9\-_]+?\.[a-zA-Z0-9\-_]+?\.([a-zA-Z0-9\-_]+)?$/
  }
  expected_response.each do |param, value|
    expected_response[param] = matchers[value] if matchers[value]
  end
  body = JSON.parse(last_response.body) if last_response.body.present?
  expected_response.each do |param, value|
    if param == 'status'
      expect(last_response.status).to eq(value.split(' ')[0].to_i)
    elsif value.is_a? Regexp
      expect(body[param]).to match(value)
    else
      expect(body[param].to_s).to eq(value)
    end
  end
end

Given(/^The following user exists in the system$/) do |table|
  user = table.hashes[0]
  unless User.exists?(email: user['email'])
    User.create!(email: user['email'], password: user['password'])
  end
end

When(/^I login as the following user$/) do |table|
  user = table.hashes[0]
  body = { auth: { email: user['email'], password: user['password'] } }
  post 'api/user_token', body
end

When(/^I navigate to the url (.*)$/) do |url|
  get url, format: :json
end
