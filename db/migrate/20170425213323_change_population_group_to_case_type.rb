class ChangePopulationGroupToCaseType < ActiveRecord::Migration[5.0]
  def change
    rename_column :shelter_buildings, :population_group, :case_type
  end
end
