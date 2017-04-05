# a building that houses shelter units
class ShelterBuilding < Compartment
  has_many :floors
  has_many :units, through: :floors
  has_many :beds, through: :floors
  has_many :censuses
  belongs_to :address
  belongs_to :shelter, required: true

  validates :slug, uniqueness: true

  after_initialize :ensure_name
  before_save :create_slug

  def bed_count(include_surge = false)
    count = beds.any? ? beds.count : units.sum(:beds)
    count += surge_beds if include_surge && surge_beds
    count
  end

  private

  def ensure_name
    return unless name.nil? && address
    self.name = address.street_address1
  end

  def create_slug
    self.slug = name.parameterize
  end
end
