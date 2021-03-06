#
# a building that houses shelter units
#
# == Schema Information
#
# Table name: shelter_buildings
#
#  id                :integer          not null, primary key
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  address_id        :integer
#  surge_beds        :integer
#  shelter_id        :integer
#  date_opened       :datetime
#  slug              :string
#  case_type_slug    :string
#  shelter_type_slug :string
#  program_type_slug :string
#
class ShelterBuilding < ApplicationRecord
  has_many :floors
  has_many :places, through: :floors, source: :places
  has_many :censuses
  belongs_to :address
  belongs_to :shelter, required: true
  belongs_to :case_type, foreign_key: :case_type_slug, primary_key: :slug
  belongs_to :shelter_type, foreign_key: :shelter_type_slug, primary_key: :slug
  belongs_to :program_type, foreign_key: :program_type_slug, primary_key: :slug

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

  def self.find_by_case_type(name)
    classifier = Classifier.find_by(name: name)
    return if classifier.nil?
    children = classifier.children
    if children.any?
      names = children.map(&:name) << name
      ShelterBuilding.includes(:case_type).where(classifiers: { name: names })
    else
      ShelterBuilding.includes(:case_type).where(classifiers: { name: name })
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
