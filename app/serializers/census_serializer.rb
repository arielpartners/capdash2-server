class CensusSerializer < ActiveModel::Serializer
  attributes :building, :shelter, :shelter_date, :as_of_date, :author, :datetime
  def shelter
    object.shelter_building.shelter.name
  end

  def building
    object.shelter_building.name
  end

  def as_of_date
    object.created_at.to_date
  end
end
