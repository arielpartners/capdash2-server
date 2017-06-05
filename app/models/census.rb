#
# The number of persons within an adult shelter (contrast to Roster).
# In order to determine which units are in use and which are available
# on a daily basis, adult shelters conduct a continual census count in order
# to track bed usage and availability.
# This is especially important since they often have an "open plan"
# with many beds in a large open area.
# Census information is typically captured manually each overnight at preset
# times: 10:30pm, 11:15pm, 12:15am, and 2:15am, and recorded in a database
# the following business day.
# A shelter building may have a capacity of 88, a census of 80, 4 offline,
# and availability of 4. Shelter providers are remunerated based on final
# nightly census tallies averaged over a period of time.
#
# == Schema Information
#
# Table name: censuses
#
#  id                  :integer          not null, primary key
#  shelter_building_id :integer
#  count               :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  entered_by          :string
#  shelter_date        :date
#  census_time         :datetime
#
class Census < ApplicationRecord
  belongs_to :shelter_building, required: true

  before_save :set_shelter_date

  scope :shelter_date, (lambda do |date|
    where shelter_date: Date.strptime(date, '%m/%d/%Y')
  end)
  scope :entered_by, ->(name) { where entered_by: name }
  scope :as_of, ->(date) { where('created_at <= ?', date) }
  scope :building, (lambda do |slug|
    id = ShelterBuilding.find_by(slug: slug)
    where(shelter_building_id: id)
  end)

  private

  def set_shelter_date
    self.shelter_date = ShelterDate.new(census_time, 3).date
  end
end
