Given(/^the following list of shelter units:$/) do |table|
  entries = table.hashes
  entries.each do |entry|
    shelter = Shelter.find_or_create_by!(id: entry['Shelter ID']) do |s|
      s.name = entry['Shelter']
    end
    building = ShelterBuilding.find_or_create_by!(name: entry['Building'],
                                                  shelter: shelter)
    floor = Floor.find_or_create_by!(shelter_building: building,
                                     name: entry['Floor'])
    if entry['Shelter Type'] == 'Single Adult'
      Bed.create!(name: entry['Unit'], compartment: floor)
    elsif entry['Shelter Type'] == 'Family'
      Unit.create!(name: entry['Unit'], compartment: floor,
                   bed_count: entry['Beds'])
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
      population_group: entry['Population Group'],
      date_opened: DateTime.parse(entry['Date Opened'])
    )
  end
end
