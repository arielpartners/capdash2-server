# a building that houses shelter units
class ShelterBuilding < ApplicationRecord
  has_many :floors
  has_many :units, through: :floors
  has_one :address

  def bed_count(include_surge = false)
    beds = self.units.sum(:beds)
    include_surge ? beds + surge_beds : beds
  end
end
