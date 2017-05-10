class CensusSerializer < ActiveModel::Serializer
  attributes :building, :shelter, :shelter_date, :as_of_date, :author,
  :datetime, :occupied_units

  def shelter
    object.shelter_building.shelter.name
  end

  def building
    object.shelter_building.name
  end

  def as_of_date
    object.created_at.to_date
  end

  def datetime
    object.datetime.strftime('%m/%d/%Y %-I:%M%#p')
  end

  def occupied_units
    object.count
  end
end
