User.create!(email: "sample_user@dhs.nyc.gov", password: "password")
User.create!(email: "some_person@dhs.nyc.gov", password: "swordfish")
User.create!(email: "anotherone@dhs.nyc.gov", password: "example")

renewal = Provider.create!(name: 'Project Renewal')
hfth = Provider.create!(name: 'Homes for the Homeless')

ewms = Shelter.create!(name: "East Williamsburg Men's Shelter", provider: renewal)
prospect = Shelter.create!(name: 'Prospect Interfaith', provider: hfth)

ew1 = ShelterBuilding.create!(name: 'EW Bldg 1', shelter: ewms)
kelly = ShelterBuilding.create!(shelter: prospect, address: Address.new(
  street_number: '730', street_name: 'Kelly Street'))

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
