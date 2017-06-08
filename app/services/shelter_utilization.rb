#
# ShelterUtilization tracks the utilization (in both raw numbers and as a
# pecentage of capcity) of ShelterBuildings. It also can aggregate those
# numbers by case-type or for the entire system.
#
class ShelterUtilization
  attr_accessor :facility, :building, :address, :average_utilization,
                :percentage, :capacity, :group, :from_date, :to_date

  def self.for_all_buildings(params)
    ShelterBuilding.all.map do |sb|
      new(params).for_building(sb)
    end
  end

  def self.for_all_case_types(params)
    group_results = CaseType.all.map do |ct|
      new(params).for_group(ct)
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

  def initialize(params = {})
    period = params[:period_type] || :day
    self.to_date = if params[:period_ending]
                     Date.parse(params[:period_ending])
                   else
                     ShelterDate.new(Time.now).date
                   end
    self.from_date = to_date - 1.send(period)
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
