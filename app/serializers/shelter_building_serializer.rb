class ShelterBuildingSerializer < ActiveModel::Serializer
  attributes :id, :name,  :surge_beds, :shelter_id, :date_opened, :address,
             :population_group, :slug, :address_id, :created_at, :updated_at
  def address
    return nil if object.address.nil?
    "#{object.address.street_number} #{object.address.street_name}"
  end
end
