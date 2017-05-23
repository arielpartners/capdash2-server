require 'rails_helper'

RSpec.describe ShelterBuilding, type: :model do
  it 'defaults name to first street address line' do
    address = Address.new(
      line1: '33 Beaver St',
      city: 'New York',
      state: 'NY',
      zip: '10004'
    )
    shelter_building = ShelterBuilding.create(address: address)
    expect(shelter_building.name).to eq('33 Beaver St')
  end
  it 'can be retrieved by case type' do
    building = ShelterBuilding.create!(
      name: 'example building',
      case_type: CaseType.new(name: 'Single Adult Male'),
      shelter: mock_model(Shelter)
    )
    expect(ShelterBuilding.find_by_case_type('Single Adult Male'))
      .to include(building)
  end
end
