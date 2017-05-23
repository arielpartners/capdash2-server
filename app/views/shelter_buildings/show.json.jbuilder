json.extract! @shelter_building, :name, :surge_beds, :shelter_id, :date_opened,
              :address, :slug, :created_at, :updated_at, :floors
json.units @shelter_building.places.count
json.beds @shelter_building.bed_count(true)
json.case_type @shelter_building.case_type.name if @shelter_building.case_type
