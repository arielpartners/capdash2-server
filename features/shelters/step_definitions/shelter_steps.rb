Given(/^the following list of shelter units:$/) do |table|
  units = table.hashes
  units.each do |unit|
    shelter = Shelter.find_or_create_by(id: unit['Shelter Id']) do |s|
      s.name = unit['Shelter']
    end
    building = ShelterBuilding.find_or_create_by(name: unit['Building'])
    floor = Floor.find_or_create_by(shelter_building: building,
                                    name: unit['Floor'])
    Unit.create!(
      name: unit['Unit'], floor: floor, beds: unit['Beds'].to_i,
      shelter: shelter
    )
  end
end

Given(/^the following shelter information:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I navigate to the following url \/shelters\/(\d+)\/buildings\/EW\-Blgd\-(\d+)$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the following information$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end
