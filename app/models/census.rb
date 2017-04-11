class Census < ApplicationRecord
  belongs_to :shelter_building, required: true

  before_save :calculate_utilization

  def self.utilization_averages
    sql = <<-SQL
    SELECT
      shelter_buildings.name as building,
      shelters.name as shelter,
      c.percentage,
      c.avg_utilization,
      addresses.street_number,
      addresses.street_name
    FROM (
      SELECT shelter_building_id,
      avg(utilization) as percentage,
      avg(count) as avg_utilization
      FROM censuses
      GROUP BY shelter_building_id
    ) AS c
    JOIN shelter_buildings
    ON shelter_buildings.id = c.shelter_building_id
    JOIN addresses
    ON addresses.id = shelter_buildings.address_id
    JOIN shelters
    ON shelters.id = shelter_buildings.shelter_id
    SQL
    results = Census.find_by_sql(sql)
    results.map do |result|
      {
        facility: result.shelter,
        building: result.building,
        address: "#{result.street_number} #{result.street_name}",
        average_utilization: result.avg_utilization.round,
        percentage: (result.percentage * 100).round
      }
    end
  end

  private

  def calculate_utilization
    self.utilization = (self.count.to_f / self.shelter_building.places.count.to_f).round(3)
  end
end
