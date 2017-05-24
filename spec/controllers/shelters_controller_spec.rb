require 'rails_helper'

RSpec.describe SheltersController, type: :controller do
  it 'can show shelter by provider slug' do
    dhs = Provider.create!(name: 'DHS')
    Shelter.create!(name: 'My Shelter', provider: dhs)
    response = get :index, params: { provider: 'dhs' }
    expect(JSON.parse(response.body).first).to include('name' => 'My Shelter')
  end
end
