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

When(/^I ask for census information$/) do |table|
  query = table.hashes[0]
  id = ShelterBuilding.find_by(name: query['Building']).id
  params = {
    building: id,
    shelter_date: query['Business Date']
  }
  resp = get 'api/census', params
  byebug
end
