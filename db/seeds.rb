User.create!(email: "sample_user@dhs.nyc.gov", password: "password")
User.create!(email: "some_person@dhs.nyc.gov", password: "swordfish")
User.create!(email: "anotherone@dhs.nyc.gov", password: "example")

ew1 = ShelterBuilding.create!(name: 'EW Bldg 1')
kelly = ShelterBuilding.create!(name: '730 Kelly Street')

ewms = Shelter.create!(name: "East Williamsburg Men's Shelter")
prospect = Shelter.create!(name: 'Prospect Interfaith')

single_units = [
  { name: '1A', floor: '1', beds: 1},
  { name: '1B', floor: '1', beds: 1},
  { name: '1C', floor: '1', beds: 1},
  { name: '1D', floor: '1', beds: 1},
  { name: '1E', floor: '1', beds: 1},
  { name: '1F', floor: '1', beds: 1},
  { name: '1G', floor: '1', beds: 1}
]

single_units.each do |unit|
  Unit.create!(name:unit[:name], floor: unit[:floor], shelter_building: ew1,
               shelter: ewms, beds: unit[:beds])
end

family_units = [
  { name: '1A', floor: '1', beds: 4 },
  { name: '1B', floor: '1', beds: 4 },
  { name: '1C', floor: '1', beds: 4 },
  { name: '2A', floor: '2', beds: 4 },
  { name: '2B', floor: '2', beds: 4 },
  { name: '2C', floor: '2', beds: 4 },
  { name: '3A', floor: '3', beds: 4 },

]

family_units.each do |unit|
  Unit.create!(name: unit[:name], floor: unit[:floor], beds: unit[:beds],
              shelter: prospect, shelter_building: kelly)
end
