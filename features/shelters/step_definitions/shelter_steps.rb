Given(/^the following list of shelter units:$/) do |table|
  units = table.hashes
  units.each do |unit|
    shelter = Shelter.find_or_create_by!(id: unit['Shelter ID']) do |s|
      s.name = unit['Shelter']
    end
    building = ShelterBuilding.find_or_create_by!(name: unit['Building'],
                                                  shelter: shelter)
    floor = Floor.find_or_create_by!(shelter_building: building,
                                    name: unit['Floor'])
    Unit.create!(
      name: unit['Unit'], floor: floor, beds: unit['Beds'].to_i,
      shelter: shelter
    )
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
      population_group: entry['Population Group'],
      date_opened: DateTime.parse(entry['Date Opened'])
    )
  end
end
