json.array! @shelter_buildings do |building|
  json.extract! building, :name, :surge_beds, :shelter_id, :date_opened,
                          :address, :slug
  json.address building.address.to_s
  json.units building.places.count
  json.beds building.bed_count(true)
  json.case_type building.case_type.to_s
  json.floors building.floors do |floor|
    json.partial! 'floors/floor', floor: floor
  end
end
