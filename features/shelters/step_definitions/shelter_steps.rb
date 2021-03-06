Given(/^the following list of shelter (.*):$/) do |type, table|
  entries = table.hashes
  entries.each do |entry|
    shelter  = Shelter.find_or_create_by!(id: entry['Shelter ID']) do |s|
      s.name = entry['Shelter']
    end
    building = ShelterBuilding.find_or_create_by!(name:    entry['Building'],
                                                  shelter: shelter)
    floor    = Floor.find_or_create_by!(shelter_building: building,
                                        name:             entry['Floor'])
    if type == 'units'
      Unit.create!(name:      entry['Unit'], compartment: floor,
                   bed_count: entry['Beds'])
    else
      Bed.create!(name: entry['Unit'], compartment: floor)
    end
  end
end

Given(/^the following shelter building information:$/) do |table|
  entries = table.hashes
  entries.each do |entry|
    shelter   = Shelter.find_or_create_by!(name: entry['Shelter'])
    building  = ShelterBuilding.find_or_create_by!(name:    entry['Building'],
                                                   shelter: shelter)
    case_type = CaseType.find_by(name: entry['Case Type'])
    building.update!(
      surge_beds:  entry['Surge Beds'],
      case_type:   case_type,
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
  entries   = table.hashes
  entries.each do |entry|
    expect(providers).to include(entry['Provider'])
  end
end

Given(/^Shelters in the system$/) do |table|
  entries = table.hashes
  entries.each do |entry|
    Shelter.create!(
      name:     entry['Shelter'],
      provider: Provider.new(name: entry['Provider'])
    )
  end
end

Then(/^I should see the following shelter information$/) do |table|
  entries       = table.hashes
  response_body = JSON.parse(last_response.body)
  entries.each do |entry|
    returned_shelter = response_body.find { |s| s['name'] == entry['Shelter'] }
    expect(returned_shelter['name']).to eq(entry['Shelter'])
  end
end

Given(/^Shelter Buildings in the system$/) do |table|
  entries = table.hashes
  entries.each do |entry|
    address = Address.new(
      line1:   entry['Street Address'],
      borough: entry['Borough'].downcase,
      zip: entry['Zip Code']
    )
    provider = Provider.new(name: entry['Provider'])
    shelter  = Shelter.new(name: entry['Shelter'], provider: provider)
    ShelterBuilding.create!(
      name:      entry['Building'],
      shelter:   shelter,
      address:   address,
      case_type: entry['Case Type']
    )
  end
end

Then(/^I should see the following shelter building information$/) do |table|
  response_body = JSON.parse(last_response.body)
  entries       = table.hashes
  entries.each do |entry|
    returned_shelter_building = response_body.find do |b|
      b['name'] == entry['Building']
    end
    expect(returned_shelter_building['name']).to eq(entry['Building'])
  end
end

# rubocop:disable Metrics/LineLength
When(/^we ask for the case type for building "([^"]*)" and floor "([^"]*)"$/) do |building, floor|
  @floor = Floor.where(name: floor).includes(:shelter_building)
                .where('shelter_buildings.name' => building).first
end

When(/^I group the number of shelter buildings in the system by Classifier:$/) do |table|
  first_row  = table.rows_hash
  @buildings = ShelterBuilding.find_by_case_type(first_row['Case Type'])
end
# rubocop:enable Metrics/LineLength

Then(/^I should see (\d+) shelter buildings$/) do |n|
  expect(@buildings.count).to eq(n.to_i)
end

Given(/^Shelter Floors in the system$/) do |table|
  entries = table.hashes
  entries.each do |entry|
    building = ShelterBuilding.find_by(name: entry['Building'])
    count    = entry['Beds'].to_i
    floor    = Floor.new(shelter_building: building, name: entry['Floor'])
    count.times { floor.places << Bed.new }
    floor.case_type = CaseType.find_by(name: entry['Case Type'])
    floor.save!
  end
end

Then(/^we are told it is case type "([^"]*)"$/) do |type|
  expect(@floor.case_type.name).to eq(type)
end
