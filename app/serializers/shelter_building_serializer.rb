class ShelterBuildingSerializer < ActiveModel::Serializer
  attributes :id, :name,  :surge_beds, :shelter_id, :date_opened, :address,
             :population_group, :slug, :address_id, :created_at, :updated_at
end
