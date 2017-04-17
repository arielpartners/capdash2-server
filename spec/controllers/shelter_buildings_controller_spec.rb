require 'rails_helper'

RSpec.describe ShelterBuildingsController, type: :controller do
  it 'returns 404 when a shelter building is not found' do
    params = { shelter_id: 1, id: 'not_a_real_building' }
    get :show, params: params
    expect(response.status).to eq(404)
  end
end
