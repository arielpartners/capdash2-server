json.array! @censuses do |census|
  json.shelter census.shelter_building.shelter.name
  json.building census.shelter_building.name
  json.entered_on census.created_at.to_date
  json.census_time census.census_time.strftime('%m/%d/%Y %-I:%M%#p')
  json.extract! census, :shelter_date, :entered_by
  json.occupied_units census.count
end
