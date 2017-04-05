Given(/^The following shelters exist in the system$/) do |table|
  entries = table.hashes
  entries.each do |entry|
    address = Address.create!(
      street_address1: entry['Street Address'],
      city: entry['Borough'],
      zip: entry['Zip Code']
    )
    shelter = Shelter.create!(
      name: entry['Shelter'],
      provider: Provider.new(name: entry['Provider'])
    )
    building = ShelterBuilding.create!(
      address: address,
      population_group: entry['Shelter Type'],
      name: entry['Building'],
      shelter: shelter
    )
    floor = building.floors.create!(name: '1')
    Unit.transaction do
      entry['Units'].to_i.times do |i|
        Unit.create!(
          shelter: shelter,
          name: i,
          beds: [Bed.new],
          floor: floor
        )
      end
    end
  end
end

Given(/^The following census information exists in the system$/) do |table|
  entries = table.hashes
  entries.each do |entry|
    building = ShelterBuilding.find_by(name: entry['Building'])
    Census.create!(
      count: entry['Occupied'],
      observed_for: DateTime.parse(entry['Business Date']),
      shelter_building: building
    )
  end
end

When(/^I ask for following average utilization by calendar period$/) do |table|
  # TODO: custom queries
  post 'utilization'
end

Then(/^The system should provide the following average utilization$/) do |table|
  results = JSON.parse(last_response.body)
  entries = table.hashes
  entries.each do |entry|
    result = results.find { |r| entry['Facility'] == r['facility'] }
    formatted_percentage = "#{result['percentage']}%"
    expect(formatted_percentage).to eq(entry['Percentage'])
    expect(result['average_utilization'].to_s).to eq(entry['Average Utilization'])
    expect(result['address']).to eq(entry['Street Address'])
  end
end