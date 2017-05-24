require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it 'provides the email and username of authenticated current user' do
    user = User.create!(email: 'user@example.com', password: 'password',
                        name: 'John Doe')
    include_auth_header(user)
    response = get :current
    response_body = JSON.parse(response.body)
    expect(response_body['email']).to eq('user@example.com')
    expect(response_body['name']).to eq('John Doe')
  end
end
