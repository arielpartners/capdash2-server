# a building that houses shelter units
class ShelterBuilding < ApplicationRecord
  has_many :floors
  has_many :places, through: :floors, source: :places
  has_many :censuses
  belongs_to :address
  belongs_to :shelter, required: true
  belongs_to :case_type
  belongs_to :shelter_type

  validates :slug, uniqueness: true

  after_initialize :ensure_name
  after_initialize :ensure_surge_bed_value
  before_save :create_slug

  def bed_count(include_surge = false)
    beds = places.sum(:bed_count)
    include_surge ? beds + surge_beds : beds
  end

  def case_type=(type)
    if type.is_a? String
      self.case_type = CaseType.find_by(name: type)
    else
      super
    end
  end

  private

  def ensure_name
    return unless name.nil? && address
    self.name = address.line1
  end

  def ensure_surge_bed_value
    self.surge_beds ||= 0
  end

  def create_slug
    self.slug = name.parameterize
  end
end
