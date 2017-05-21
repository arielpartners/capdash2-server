#
# Provide friendly JSON for a ShelterBuilding for the front-end.  For
# example, by returning selected fields from related objects (e.g. count).
# @see ShelterBuilding
#
class ShelterBuildingSerializer < ActiveModel::Serializer
  attributes :id, :name, :surge_beds, :shelter_id, :date_opened, :address,
             :case_type, :slug, :created_at, :updated_at, :units, :beds, :floors

  def units
    object.places.count
  end

  def beds
    object.bed_count(true)
  end

  def case_type
    object.case_type.nil? ? nil : object.case_type.name
  end
end
