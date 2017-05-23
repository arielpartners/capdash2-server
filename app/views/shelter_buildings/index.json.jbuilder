json.array! @shelter_buildings do |building|
  json.extract! building, :name, :surge_beds, :shelter_id, :date_opened,
                          :address, :slug, :created_at, :updated_at, :floors
  json.units building.places.count
  json.beds building.bed_count(true)
  json.case_type building.case_type.name if building.case_type
end
