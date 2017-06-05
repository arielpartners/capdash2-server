#
# This service class calculates shelter utilization
#
class UtilizationService
  def self.averages(params)
    case params[:group_by].parameterize
    when 'shelter'
      averages_by_building
    when 'case-type'
      averages_by_case_type
    else
      raise ArgumentError, 'Invalid group_by parameter'
    end
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def self.averages_by_building
    utilizations = Census.group(:shelter_building_id).average(:count)
    utilizations.map do |building_id, utilization|
      building = ShelterBuilding.find(building_id)
      capacity = building.places.count
      {
        facility: building.shelter.name,
        building: building.name,
        address: building.address.line1,
        average_utilization: utilization.round,
        percentage: ((utilization / capacity) * 100).round
      }
    end
  end

  def self.averages_by_case_type
    utilization_counts = Hash.new(0)
    capacity_counts    = Hash.new(0)
    averages_by_building.each do |entry|
      building = ShelterBuilding.find_by(name: entry[:building])
      utilization = entry[:average_utilization]
      capacity = building.places.count
      case_type = building.case_type.name
      utilization_counts[case_type] += utilization.to_i
      capacity_counts[case_type] += capacity
      utilization_counts['Total'] += utilization.to_i
      capacity_counts['Total'] += capacity
    end
    utilization_counts.map do |case_type, count|
      {
        group: case_type,
        average_utilization: count,
        average_capacity: capacity_counts[case_type],
        percentage: ((count.to_f / capacity_counts[case_type]) * 100).round
      }
    end
  end
end
