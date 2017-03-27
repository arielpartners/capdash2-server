class CreateFloors < ActiveRecord::Migration[5.0]
  def change
    create_table :floors do |t|
      t.string :name
      t.integer :shelter_building_id
      t.timestamps
    end
    add_index :floors, :shelter_building_id
    remove_column :units, :floor
    remove_column :units, :shelter_building_id
    add_column :units, :floor_id, :integer
    add_index :units, :floor_id
  end
end
