class UtilizationService

  def self.averages(params)
    case params[:group_by]
    when 'Shelter' then averages_by_building
    when 'Case Type' then averages_by_case_type
    end
  end

  def self.averages_by_building
    sql = <<-SQL
    SELECT
      shelter_buildings.name as building,
      shelters.name as facility,
      round((c.percentage * 100)::numeric, 0) as percentage,
      round(c.avg_utilization,0) as average_utilization,
      addresses.line1 as address
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
    results = ActiveRecord::Base.connection.exec_query(sql)
    results.to_hash
  end

  def self.averages_by_case_type
    ql = <<-SQL
      SELECT case_type.name as group,
      round(sum(c.avg_utilization),0) as average_utilization
      -- count(places) as capacity
      FROM (
        SELECT shelter_building_id,
        avg(count) as avg_utilization
        FROM censuses
        GROUP BY shelter_building_id
      ) AS c
      JOIN shelter_buildings
      ON c.shelter_building_id = shelter_buildings.id
      JOIN classifiers as case_type
      ON shelter_buildings.case_type_id = case_type.id
      GROUP BY case_type.name
    SQL
    results = ActiveRecord::Base.connection.exec_query(sql)
    results = results.to_hash
    byebug
    results.each do |result|
      capacity = CaseType.find_by(name: result['group']).places.count
      capacity = result['capacity']
      result[:average_capacity] = capacity
      result[:percentage] = ((result['average_utilization'].to_f / capacity) * 100).round
    end
    byebug

    # utilization_sum = ActiveRecord::Base.connection.exec_query <<-SQL
    #   SELECT round(sum(c.avg_utilization),0) as total
    #   FROM (
    #     SELECT shelter_building_id,
    #     avg(count) as avg_utilization
    #     FROM censuses
    #     GROUP BY shelter_building_id
    #   ) AS c
    # SQL
    # total_utilization = utilization_sum[0]['total']
    total_utilization = results.reduce(0){|sum, result| sum + result['average_utilization'].to_i}
    total_capacity = Place.count
    percentage = ((total_utilization.to_f / total_capacity) * 100).round
    results << {
      group: 'Total',
      average_capacity: Place.count,
      average_utilization: total_utilization,
      percentage: percentage
    }
    results
  end
end
