User.create!(email: "sample_user@dhs.nyc.gov", name: "John Doe", password: "password")
User.create!(email: "some_person@dhs.nyc.gov", name: "Jane Doe", password: "swordfish")
User.create!(email: "anotherone@dhs.nyc.gov", name: "Nick Iorio", password: "example")

single = CaseType.create!(name: 'Single Adult', description: 'Single adult homeless client')
CaseType.create!(name: 'Single Adult Male', parent: single)
CaseType.create!(name: 'Single Adult Female', parent: single)
CaseType.create!(
  name: 'Adult Family',
  description: 'Case type consisting of two or more related adults, no children under 18'
)
CaseType.create!(name: 'Family with Children', description: 'includes pregnant single women')
ShelterType.create!(name: 'Shelter', description: 'regular shelter that does not qualify as tier 2')
ShelterType.create!(
  name: 'Late Arrival',
  code: 'FTC005',
  description: 'Overnight shelter for families with children that arrive after '\
  '5pm; they are placed in the shelters and then in the morning return to an '\
  'intake center (e.g. PATH) to finish the application process.'
)
ShelterType.create!(
  name: 'Hotel'
  description: 'A currently-operating hotel that for may agree to provide rooms'\
  ' at regular commercial rates for emergency shelter use for overflow clients.'\
  '  Facility type “hotel” includes both converted former hotel buildings as '\
  'well as active commercial hotels.'
)
ShelterType.create!(
  name: 'Cluster',
  description: 'An apartment in a private apartment building that is used to'\
  'house homeless, as well as renting families. Social services are limited and'\
  'the shelter does not qualify as a tier II.  Clusters are a special agreement'\
  'with providers where providers acquire units for sheltering that are in'\
  'standard residential buildings, where the buildings typically already have'\
  'private tenants.  Buildings may be in close proximity or they may be disbursed. '\
  'Mayor DeBlasio is phasing out the cluster program over the next three years.'
)
ShelterType.create!(
  name: 'Tier 2',
  description: 'An apartment-style facility with a cooking space and a bathroom'\
  ' for each family.  Tier II shelters may be an institutional shelter setting '\
  'with private rooms offering three meals a day and/or cooking apparatus, as '\
  'well as enhanced social services.'
)
programs = [
  'Adult Commercial Hotel',
  'Annex',
  'Assessment',
  'Criminal Justice',
  'Diversion',
  'Employment',
  'General',
  'Mental Health',
  'MICA',
  'Special Population',
  'Substance Abuse',
  'Young Adult'
]
programs.each { |program| ProgramType.create!(name: program) }

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
