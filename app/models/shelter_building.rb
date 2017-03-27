# a building that houses shelter units
class ShelterBuilding < ApplicationRecord
  has_many :floors
  has_many :units, through: :floor
  has_one :address

  def bed_count
    self.units.sum(:beds)
  end
end
