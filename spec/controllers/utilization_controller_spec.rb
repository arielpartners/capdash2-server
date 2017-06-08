require 'rails_helper'

RSpec.describe UtilizationController, type: :controller do
  it 'returns 400 bad request when group_by paramaeter is missing/invalid' do
    response = get :show, params: { group_by: 'bad-data' }
    expect(response.status).to eq(400)
  end
end
