Given(/^The following occuped units information exists in the system$/) do |table|
  entries = table.hashes
  entries.each do |entry|
    building = ShelterBuilding.find_by(name: entry['Building'])
    Census.create!(
      shelter_building: building,
      count: entry['Occupied Units'],
      author: entry['Who Entered'],
      datetime: entry['Census DateTime'],
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
  get 'api/census', params
end

Then(/^The system should provide the following census information$/) do |table|
  body = JSON.parse(last_response.body)
  expected = table.hashes[0]
  byebug
end
