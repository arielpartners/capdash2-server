User.create!(email: "sample_user@dhs.nyc.gov", password: "password")
User.create!(email: "some_person@dhs.nyc.gov", password: "swordfish")
User.create!(email: "anotherone@dhs.nyc.gov", password: "example")

ewms = Shelter.create!(name: "East Williamsburg Men's Shelter")
prospect = Shelter.create!(name: 'Prospect Interfaith')

ew1 = ShelterBuilding.create!(name: 'EW Bldg 1', shelter: ewms)
kelly = ShelterBuilding.create!(shelter: prospect, address: Address.new(
  street_address1: '730 Kelly Street'))

ew_first_floor = Floor.create!(shelter_building: ew1, name: '1')
kelly_1fl = Floor.create!(shelter_building: kelly, name: '1')
kelly_2fl = Floor.create!(shelter_building: kelly, name: '2')
kelly_3fl = Floor.create!(shelter_building: kelly, name: '3')

single_units = [
  { name: '1A', beds: 1},
  { name: '1B', beds: 1},
  { name: '1C', beds: 1},
  { name: '1D', beds: 1},
  { name: '1E', beds: 1},
  { name: '1F', beds: 1},
  { name: '1G', beds: 1}
]

single_units.each do |unit|
  Unit.create!(name:unit[:name], floor: ew_first_floor, shelter: ewms,
               beds: unit[:beds])
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
  Unit.create!(name: unit[:name], floor: unit[:floor], beds: unit[:beds],
              shelter: prospect)
end
