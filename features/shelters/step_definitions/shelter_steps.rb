Given(/^the following list of shelter (.*):$/) do |type, table|
  entries = table.hashes
  entries.each do |entry|
    shelter = Shelter.find_or_create_by!(id: entry['Shelter ID']) do |s|
      s.name = entry['Shelter']
    end
    building = ShelterBuilding.find_or_create_by!(name: entry['Building'],
                                                  shelter: shelter)
    floor = Floor.find_or_create_by!(shelter_building: building,
                                     name: entry['Floor'])
    if type == 'units'
      Unit.create!(name: entry['Unit'], compartment: floor,
                   bed_count: entry['Beds'])
    else
      Bed.create!(name: entry['Unit'], compartment: floor)
    end
  end
end

Given(/^the following shelter building information:$/) do |table|
  entries = table.hashes
  entries.each do |entry|
    shelter = Shelter.find_or_create_by!(name: entry['Shelter'])
    building = ShelterBuilding.find_or_create_by!(name: entry['Building'],
                                                  shelter: shelter)
    building.update!(
      surge_beds: entry['Surge Beds'],
      case_type: entry['Case Type'],
      date_opened: DateTime.parse(entry['Date Opened'])
    )
  end
end

Given(/^Providers in the system$/) do |table|
  entries = table.hashes
  entries.each do |entry|
    Provider.create!(name: entry['Provider'])
  end
end

Then(/^I should see the following provider information$/) do |table|
  providers = JSON.parse(last_response.body).map { |p| p['name'] }
  entries = table.hashes
  entries.each do |entry|
    expect(providers).to include(entry['Provider'])
  end
end

Given(/^Shelters in the system$/) do |table|
  entries = table.hashes
  entries.each do |entry|
    Shelter.create!(
      name: entry['Shelter'],
      provider: Provider.new(name: entry['Provider'])
    )
  end
end

Then(/^I should see the following shelter information$/) do |table|
  entries = table.hashes
  response_body = JSON.parse(last_response.body)
  entries.each do |entry|
    returned_shelter = response_body.find { |s| s['name'] == entry['Shelter'] }
    expect(returned_shelter['name']).to eq(entry['Shelter'])
  end
end

Given(/^Shelter Buildings in the system$/) do |table|
  entries = table.hashes
  entries.each do |entry|
    address = Address.new(line1: entry['Street Address'],
                          borough: entry['Borough'], zip: entry['Zip Code'])
    provider = Provider.new(name: entry['Provider'])
    shelter = Shelter.new(name: entry['Shelter'], provider: provider)
    ShelterBuilding.create!(name: entry['Building'], shelter: shelter,
                            address: address)
  end
end

Then(/^I should see the following shelter building information$/) do |table|
  response_body = JSON.parse(last_response.body)
  entries = table.hashes
  entries.each do |entry|
    returned_shelter_building = response_body.find { |b| b['name'] == entry['Building'] }
    expect(returned_shelter_building['name']).to eq(entry['Building'])
  end
end

When(/^we ask for the Case type for the building "([^"]*)" and floor "([^"]*)"$/) do |arg1, arg2|
  # byebug
end

Given(/^Shelter Floors in the system$/) do |table|
  entries = table.hashes
  entries.each do |entry|
    building = ShelterBuilding.find_by(name: entry['Building'])
    count = entry['Beds'].to_i
    floor = Floor.new(shelter_building: building, name: entry['Floor'])
    count.times { floor.places << Bed.new }
    floor.save!
  end
end
