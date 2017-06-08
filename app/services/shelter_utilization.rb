#
# Domain model for shelter utilization
#
class ShelterUtilization
  attr_accessor :facility, :building, :address, :average_utilization,
                :percentage, :capacity, :group

  def self.for_all_buildings
    ShelterBuilding.all.map do |sb|
      new.for_building(sb)
    end
  end

  def self.for_all_case_types
    group_results = CaseType.all.map do |ct|
      new.for_group(ct)
    end
    group_results << totals
  end

  def self.totals
    totals = ShelterUtilization.new
    totals.group = 'Total'
    totals.capacity = Place.count
    total_avg_utilization = utilization_averages.values.reduce(:+)
    totals.calculate_percentage(total_avg_utilization)
    totals
  end

  def self.utilization_averages
    Census.group(:shelter_building).average(:count)
  end

  def initialize
    self.average_utilization = nil
    self.percentage = nil
  end

  def for_building(shelter_building)
    self.capacity = shelter_building.places.count
    self.facility = shelter_building.shelter.name
    self.building = shelter_building.name
    self.address = shelter_building.address.line1
    utilization = ShelterUtilization.utilization_averages[shelter_building]
    calculate_percentage(utilization)
    self
  end

  def for_group(group)
    self.group = group.name
    self.capacity = group.shelter_buildings.joins(:places).count(:places)
    avgs = ShelterUtilization.utilization_averages.select do |sb, _avg|
      sb.case_type == group
    end
    utilization = avgs.values.reduce(:+)
    calculate_percentage(utilization)
    self
  end

  def calculate_percentage(utilization)
    return unless utilization
    self.average_utilization = utilization.round
    self.percentage = ((utilization / capacity) * 100).round
  end
end
