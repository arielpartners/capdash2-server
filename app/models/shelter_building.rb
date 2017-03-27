# a building that houses shelter units
class ShelterBuilding < ApplicationRecord
  has_many :floors
  has_many :units, through: :floors
  belongs_to :address
  belongs_to :shelter, required: true

  after_initialize :ensure_name

  def bed_count(include_surge = false)
    beds = self.units.sum(:beds)
    include_surge ? beds + surge_beds : beds
  end

  private

  def ensure_name
    self.name ||= address.street_address1
  end
end
