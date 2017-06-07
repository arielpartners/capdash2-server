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

  def averages_by_building
    ShelterBuilding.all.map do |sb|
      shelter_utilization = ShelterUtilization.new(sb)
      shelter_utilization.calculate_percentage(utilizations[sb.id])
    end
  end

  def averages_by_case_type
    utilizations = Census.includes(shelter_building: :case_type).group('shelter_buildings.case_type_slug').average(:count)
    utilizations.map do |case_type, utilization|
      capacity = CaseType.find_by(slug: case_type).shelter_buildings.joins(:places).count(:places)
      {
        group: case_type,
        average_capacity: capacity,
        average_utilization: utilization.round,
        percentage: ((utilization / capacity) * 100).round
      }
    end
  end
end
