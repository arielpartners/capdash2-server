class RenameBuildingToShelterBuilding < ActiveRecord::Migration[5.0]
  def change
    rename_table :buildings, :shelter_buildings
    rename_column :units, :building_id, :shelter_building_id
  end
end
