#
# Domain model for shelter utilization
#
class ShelterUtilization
  attr_accessor :facility, :building, :address, :average_utilization,
                :percentage, :capacity

  def initialize(shelter_building)
    self.facility = shelter_building.shelter.name
    self.building = shelter_building.name
    self.address = shelter_building.address.line1
    self.average_utilization = nil
    self.percentage = nil
    self.capacity = shelter_building.places.count
  end

  def calculate_percentage(utilization)
    return self unless utilization
    self.average_utilization = utilization.round
    self.percentage = ((utilization / capacity) * 100).round
    self
  end
end
