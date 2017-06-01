require 'rails_helper'

# rubocop:disable Metrics/BlockLength
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

  context 'valid user data' do
    it 'creates a new user' do
      user_data = {
        email: 'test@google.com',
        password: 'swordfish',
        name: 'John Doe'
      }
      response = post :create, params: user_data, format: :json
      expect(response.status).to be(201)
    end
  end

  context 'invalid user data' do
    it 'returnes 422 unprocessable entity' do
      user_data = {
        email: 'test@google.com',
        password: ''
      }
      response = post :create, params: user_data, format: :json
      expect(response.status).to eq(422)
    end
  end
end
