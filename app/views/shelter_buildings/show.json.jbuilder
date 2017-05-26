json.extract! @shelter_building, :name, :surge_beds, :shelter_id, :date_opened,
              :address, :slug, :created_at, :updated_at
json.units @shelter_building.places.count
json.beds @shelter_building.bed_count(true)
json.case_type @shelter_building.case_type.to_s
json.floors @shelter_building.floors do |floor|
  json.partial! 'floors/floor', floor: floor
end
