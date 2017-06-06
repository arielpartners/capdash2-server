#
# This service class calculates shelter utilization
#
class Utilization
  def initialize(params)
    @group = params[:group_by].parameterize
    @date = Date.today
  end

  def calculate
    case @group
    when 'shelter'
      averages_by_building
    when 'case-type'
      averages_by_case_type
    else
      raise ArgumentError, 'Invalid group_by parameter'
    end
  end

  private

  def utilizations
    Census.group(:shelter_building_id).average(:count)
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def averages_by_building
    ShelterBuilding.all.map do |sb|
      capacity = sb.places.count
      utilization = utilizations[sb.id]
      record = {
        facility: sb.shelter.name,
        building: sb.name,
        address: sb.address.line1,
        average_utilization: nil,
        percentage: nil
      }
      if utilization
        record[:average_utilization] = utilization.round
        record[:percentage] = ((utilization / capacity) * 100).round
      end
      record
    end
  end

  def averages_by_case_type
    utilization_counts = Hash.new(0)
    capacity_counts    = Hash.new(0)
    utilizations.each do |sb_id, utilization|
      building = ShelterBuilding.find(sb_id)
      case_type = building.case_type.name
      capacity = building.places.count
      utilization_counts[case_type] += utilization.round
      capacity_counts[case_type] += capacity
      utilization_counts['Total'] += utilization.round
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