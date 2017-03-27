class AddShelterToShelterBuilding < ActiveRecord::Migration[5.0]
  def change
    add_column :shelter_buildings, :shelter_id, :integer
    add_index :shelter_buildings, :shelter_id
  end
end
