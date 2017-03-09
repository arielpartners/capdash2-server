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
      expect(body[param]).to eq(value)
    end
  end
end
