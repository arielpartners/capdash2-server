class Census < ApplicationRecord
  belongs_to :shelter_building, required: true

  before_save :calculate_utilization, :set_shelter_date

  scope :shelter_date, (lambda do |date|
    where shelter_date: Date.strptime(date, '%m/%d/%Y')
  end)
  scope :author, ->(author) { where author: author }
  scope :as_of, ->(date) { where('created_at <= ?', date) }
  scope :building, (lambda do |slug|
    id = ShelterBuilding.find_by(slug: slug)
    where(shelter_building_id: id)
  end)

  private

  def set_shelter_date
    self.shelter_date = ShelterDate.new(datetime, 3).date
  end

  def calculate_utilization
    self.utilization = (count.to_f / shelter_building.places.count).round(3)
  end
end
