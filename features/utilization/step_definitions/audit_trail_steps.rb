Given(/^The following occuped units information exists in the system$/) do |table|
  entries = table.hashes
  entries.each do |entry|
    building = ShelterBuilding.find_by(name: entry['Building'])
    Census.create!(
      shelter_building: building,
      count: entry['Occupied Units'],
      author: entry['Who Entered'],
      datetime: DateTime.strptime(entry['Census DateTime'], '%m/%d/%Y %I:%M%p'),
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
  params[:as_of] = query['As Of Date'] unless query['As Of Date'].blank?
  get 'api/census', params
end

Then(/^The system should provide the following census information$/) do |table|
  body = JSON.parse(last_response.body)
  expected = table.hashes[0]
  expect(body['shelter']).to eq(expected['Facility'])
  expect(body['building']).to eq(expected['Building'])
  expect(body['datetime']).to eq(expected['Census DateTime'])
  expect(body['occupied_units']).to eq(expected['Occupied Units'].to_i)
  expect(body['author']).to eq(expected['Who Entered'])
end
