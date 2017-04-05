class MoreChanges < ActiveRecord::Migration[5.0]
  def change
    remove_column :shelter_buildings, :building_id
    remove_column :units, :beds
    remove_column :beds, :floor_id
    add_column :beds, :compartment_id, :integer
    add_column :beds, :compartment_type, :string
    add_index :beds, [:compartment_type, :compartment_id]
  end
end
