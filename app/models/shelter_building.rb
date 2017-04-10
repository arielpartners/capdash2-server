# a building that houses shelter units
class ShelterBuilding < ApplicationRecord
  has_many :floors
  has_many :units, through: :floors
  has_many :floor_beds, through: :floors, source: :beds
  has_many :unit_beds, through: :units, source: :beds
  has_many :censuses
  belongs_to :address
  belongs_to :shelter, required: true

  validates :slug, uniqueness: true

  after_initialize :ensure_name
  after_initialize :ensure_surge_bed_value
  before_save :create_slug

  def beds
    floor_beds + unit_beds
  end

  def bed_count(include_surge = false)
    include_surge ? beds.count + surge_beds : beds.count
  end

  private

  def ensure_name
    return unless name.nil? && address
    self.name = "#{address.street_number} #{address.street_name}"
  end

  def ensure_surge_bed_value
    self.surge_beds ||= 0
  end

  def create_slug
    self.slug = name.parameterize
  end
end
