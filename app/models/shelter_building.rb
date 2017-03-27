# a building that houses shelter units
class ShelterBuilding < ApplicationRecord
  has_many :units
  has_one :address

  def bed_count
    self.units.sum(:beds)
  end
end
