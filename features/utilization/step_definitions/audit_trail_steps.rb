Given(/^The following occuped units information exists in the system$/) do |table|
  entries = table.hashes
  entries.each do |entry|
    building = ShelterBuilding.find_by(name: entry['Building'])
    Census.create!(
      shelter_building: building,
      count: entry['Occupied Units'],
      author: entry['Who Entered'],
      shelter_date: ShelterDate.new(entry['Census DateTime'], 0),
      created_at: DateTime.parse(entry['Entry DateTime'])
    )
  end
end
