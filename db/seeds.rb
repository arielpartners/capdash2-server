User.create!(email: "sample_user@dhs.nyc.gov", name: "John Doe", password: "password")
User.create!(email: "some_person@dhs.nyc.gov", name: "Jane Doe", password: "swordfish")
User.create!(email: "anotherone@dhs.nyc.gov", name: "Nick Iorio", password: "example")

CaseType.create!(name: 'Adult Male')
CaseType.create!(name: 'Adult Female')
CaseType.create!(name: 'Adult Male')
CaseType.create!(name: 'Adult Family')
CaseType.create!(name: 'Family with Children')
ShelterType.create!(name: 'Adult Shelter', code: 'FTC009')
ShelterType.create!(name: 'Late Arrival', code: 'FTC005')
ShelterType.create!(name: 'Family Hotel', code: 'FTC004')
ShelterType.create!(name: 'Family Cluster', code: 'FTC003')
ShelterType.create!(name: 'Adult Family Hotel', code: 'FTC008')
ShelterType.create!(name: 'Adult Family Tier 2', code: 'FTC006')
ShelterType.create!(name: 'Family Tier 2', code: 'FTC001')

samaritan = Provider.create!(name: 'Samaritan Village')
bfc = Shelter.create!(name: 'Boulevard Family Center', provider: samaritan)
a1 = Address.create!(line1: '79-00 Queens Boulevard', borough: 'Queens', city: 'Elmhurst', state: 'NY', zip: '11373')
ShelterBuilding.create!(
  address: a1, shelter: bfc, surge_beds: 5,
  case_type: 'Family with Children'
)

acacia = Provider.create!(name: 'ACACIA NETWORK HOUSING INC')
bac2 = Shelter.create!(name: 'BRONX ACACIA CLUSTER II', provider: acacia)
a2 = Address.create!(line1: '1231 Sheridan Avenue', borough: 'Bronx', city: 'Bronx', state: 'NY', zip: '10456')
ShelterBuilding.create!(
  address: a2, shelter: bac2, surge_beds: 3,
  case_type: 'Family with Children'
)

dhs = Provider.create!(name: 'NYC Department Of Homeless Services')
auburn = Shelter.create!(name: 'Auburn Family Residence', provider: dhs)
a3 = Address.create!(line1: '32 Auburn Place', borough: 'Brooklyn', city: 'Brooklyn', state: 'NY', zip: '11205')
ShelterBuilding.create!(
  address: a3, shelter: auburn, case_type: 'Families with Children'
)

life = Shelter.create!(name: 'LIFE', provider: dhs)
a4 = Address.create!(line1: '78 Catherine Street', borough: 'Manhattan', city: 'New York', state: 'NY', zip: '10038')
ShelterBuilding.create!(
  address: a4, shelter: life, case_type: 'Families with Children'
)

aguila = Provider.create!(name: 'AGUILA')
bna = Shelter.create!(name: 'BRONX NEIGHBORHOOD AGUILA', provider: aguila)
a5 = Address.create!(line1: '1101 Manor Avenue', borough: 'Bronx', city: 'Bronx', state: 'NY', zip: '10472')
ShelterBuilding.create!(
  address: a5, shelter: bna, case_type: 'Families with Children'
)
a6 = Address.create!(line1: '708 EAST 243 STREET', borough: 'Bronx', city: 'Bronx', state: 'NY', zip: '10470')
ShelterBuilding.create!(
  address: a6, shelter: bna, case_type: 'Families with Children'
)

a7 = Address.create!(line1: '1208 WESTCHESTER AVENUE', borough: 'Bronx', city: 'Bronx', state: 'NY', zip: '10459')
ShelterBuilding.create!(address: a7, shelter: bac2, case_type: 'Families with Children')

help = Provider.create!(name: 'Help U.S.A')
hbc = Shelter.create!(name: 'HELP - BRONX CROTONA', provider: help)
a8 = Address.create!(line1: '785 CROTONA PARK NORTH', borough: 'Bronx', city: 'Bronx', state: 'NY', zip: '10460')
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
