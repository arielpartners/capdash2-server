require 'rails_helper'

RSpec.describe ProvidersController, type: :controller do
  it 'will show a provider by slug' do
    Provider.create!(name: 'My Provider')
    response = get :show, params: { id: 'my-provider' }
    expect(JSON.parse(response.body)).to include('name' => 'My Provider')
  end
  it 'returns 404 when a provider is not found' do
    response = get :show, params: { id: 'not-a-real-provider' }
    expect(response.status).to eq(404)
  end
end
