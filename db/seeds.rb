User.create!(email: "sample_user@dhs.nyc.gov", password: "password")
User.create!(email: "some_person@dhs.nyc.gov", password: "swordfish")
User.create!(email: "anotherone@dhs.nyc.gov", password: "example")

samaritan = Provider.create!(name: 'Samaritan Village')
bfc = Shelter.create!(name: 'Boulevard Family Center', provider: samaritan)
a1 = Address.create!(street_number: '79-00', street_name: 'Queens Boulevard',
                borough: 'Queens', city: 'Elmhurst', state: 'NY', zip: '11373')
ShelterBuilding.create!(
  address: a1, shelter: bfc, surge_beds: 5,
  population_group: 'Family with Children'
)

acacia = Provider.create!(name: 'ACACIA NETWORK HOUSING INC')
bac2 = Shelter.create!(name: 'BRONX ACACIA CLUSTER II', provider: acacia)
a2 = Address.create!(street_number: '1231', street_number: 'Sheridan Avenue',
                    borough: 'Bronx', city: 'Bronx', state: 'NY', zip: '10456')
ShelterBuilding.create!(
  address: a2, shelter: bac2, surge_beds: 3. population_group: 'Family with Children'
)


ew_first_floor = Floor.create!(shelter_building: ew1, name: '1')
kelly_1fl = Floor.create!(shelter_building: kelly, name: '1')
kelly_2fl = Floor.create!(shelter_building: kelly, name: '2')
kelly_3fl = Floor.create!(shelter_building: kelly, name: '3')

12.times do |n|
  Bed.create!(name: n, compartment: ew_first_floor)
end

family_units = [
  { name: '1A', floor: kelly_1fl, beds: 4 },
  { name: '1B', floor: kelly_1fl, beds: 4 },
  { name: '1C', floor: kelly_1fl, beds: 4 },
  { name: '2A', floor: kelly_2fl, beds: 4 },
  { name: '2B', floor: kelly_2fl, beds: 4 },
  { name: '2C', floor: kelly_2fl, beds: 4 },
  { name: '3A', floor: kelly_3fl, beds: 4 },

]

family_units.each do |unit|
  Unit.create!(name: unit[:name], compartment: unit[:floor], bed_count: unit[:beds])
end
