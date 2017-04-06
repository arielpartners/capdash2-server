require 'rails_helper'

RSpec.describe ShelterBuilding, type: :model do
  it 'defaults name to first street address line' do
    address = Address.new(
      street_number: '33',
      street_name: 'Beaver St',
      city: 'New York',
      state: 'NY',
      zip: '10004'
    )
    shelter_building = ShelterBuilding.create(address: address)
    expect(shelter_building.name).to eq('33 Beaver St')
  end
end
