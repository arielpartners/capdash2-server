User.create!(email: "sample_user@dhs.nyc.gov", name: "John Doe", password: "password")
User.create!(email: "some_person@dhs.nyc.gov", name: "Jane Doe", password: "swordfish")
User.create!(email: "anotherone@dhs.nyc.gov", name: "Nick Iorio", password: "example")

samaritan = Provider.create!(name: 'Samaritan Village')
bfc = Shelter.create!(name: 'Boulevard Family Center', provider: samaritan)
a1 = Address.create!(line1: '79-00 Queens Boulevard', borough: 'queens', city: 'Elmhurst', state: 'NY', zip: '11373')
ShelterBuilding.create!(
  address: a1, shelter: bfc, surge_beds: 5,
  case_type: 'Family with Children'
)

acacia = Provider.create!(name: 'ACACIA NETWORK HOUSING INC')
bac2 = Shelter.create!(name: 'BRONX ACACIA CLUSTER II', provider: acacia)
a2 = Address.create!(line1: '1231 Sheridan Avenue', borough: 'bronx', city: 'Bronx', state: 'NY', zip: '10456')
ShelterBuilding.create!(
  address: a2, shelter: bac2, surge_beds: 3,
  case_type: 'Family with Children'
)

dhs = Provider.create!(name: 'NYC Department Of Homeless Services')
auburn = Shelter.create!(name: 'Auburn Family Residence', provider: dhs)
a3 = Address.create!(line1: '32 Auburn Place', borough: 'brooklyn', city: 'Brooklyn', state: 'NY', zip: '11205')
ShelterBuilding.create!(
  address: a3, shelter: auburn, case_type: 'Families with Children'
)

life = Shelter.create!(name: 'LIFE', provider: dhs)
a4 = Address.create!(line1: '78 Catherine Street', borough: 'manhattan', city: 'New York', state: 'NY', zip: '10038')
ShelterBuilding.create!(
  address: a4, shelter: life, case_type: 'Families with Children'
)

aguila = Provider.create!(name: 'AGUILA')
bna = Shelter.create!(name: 'BRONX NEIGHBORHOOD AGUILA', provider: aguila)
a5 = Address.create!(line1: '1101 Manor Avenue', borough: 'bronx', city: 'Bronx', state: 'NY', zip: '10472')
ShelterBuilding.create!(
  address: a5, shelter: bna, case_type: 'Families with Children'
)
a6 = Address.create!(line1: '708 EAST 243 STREET', borough: 'bronx', city: 'Bronx', state: 'NY', zip: '10470')
ShelterBuilding.create!(
  address: a6, shelter: bna, case_type: 'Families with Children'
)

a7 = Address.create!(line1: '1208 WESTCHESTER AVENUE', borough: 'bronx', city: 'Bronx', state: 'NY', zip: '10459')
ShelterBuilding.create!(address: a7, shelter: bac2, case_type: 'Families with Children')

help = Provider.create!(name: 'Help U.S.A')
hbc = Shelter.create!(name: 'HELP - BRONX CROTONA', provider: help)
a8 = Address.create!(line1: '785 CROTONA PARK NORTH', borough: 'bronx', city: 'Bronx', state: 'NY', zip: '10460')
help_building = ShelterBuilding.create!(address: a8, shelter: hbc,  case_type: 'Families with Children')



help_1fl = Floor.create!(shelter_building: help_building, name: '1')
help_2fl = Floor.create!(shelter_building: help_building, name: '2')
help_3fl = Floor.create!(shelter_building: help_building, name: '3')

units = [
  { name: '1A', floor: help_1fl, beds: 4 },
  { name: '1B', floor: help_1fl, beds: 4 },
  { name: '1C', floor: help_1fl, beds: 4 },
  { name: '2A', floor: help_2fl, beds: 4 },
  { name: '2B', floor: help_2fl, beds: 4 },
  { name: '2C', floor: help_2fl, beds: 4 },
  { name: '3A', floor: help_3fl, beds: 4 },
]

units.each do |unit|
  Unit.create!(name: unit[:name], compartment: unit[:floor], bed_count: unit[:beds])
end

Census.create!(shelter_building: help_building, count: 90, author: 'kpeterson', datetime: '2016-06-05 8:00pm ', created_at: '2016-06-06 10:15am' )
Census.create!(shelter_building: help_building, count: 95, author: 'cstrong', datetime: '2016-06-05 10:00pm ', created_at: '2016-06-06 10:15am' )
Census.create!(shelter_building: help_building, count: 97, author: 'bgramman', datetime: '2016-06-06 12:00am ', created_at: '2016-06-06 10:15am' )
Census.create!(shelter_building: help_building, count: 98, author: 'bgramman', datetime: '2016-06-06 2:00am ', created_at: '2016-06-06 10:15am' )
Census.create!(shelter_building: help_building, count: 103, author: 'niorio', datetime: '2016-06-06 2:00am ', created_at: '2016-06-09 2:30pm' )
Census.create!(shelter_building: help_building, count: 95, author: 'kpeterson', datetime: '2016-06-06 8:00pm', created_at: '2016-06-07 10:15am' )
