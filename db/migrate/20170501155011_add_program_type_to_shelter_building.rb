class AddProgramTypeToShelterBuilding < ActiveRecord::Migration[5.0]
  def change
    add_column :shelter_buildings, :program_type_id, :integer
  end
end
