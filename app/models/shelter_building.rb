# a building that houses shelter units
class ShelterBuilding < Compartment
  has_many :floors
  has_many :units, through: :floors
  has_many :censuses
  belongs_to :address
  belongs_to :shelter, required: true

  validates :slug, uniqueness: true

  after_initialize :ensure_name
  before_save :create_slug

  def bed_count(include_surge = false)
    beds = self.units.sum(:beds)
    if include_surge && surge_beds
      beds + surge_beds
    else
      beds
    end
  end

  private

  def ensure_name
    self.name ||= address.street_address1
  end

  def create_slug
    self.slug = self.name.parameterize
  end
end
