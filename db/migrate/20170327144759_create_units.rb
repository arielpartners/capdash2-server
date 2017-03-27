class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.string :name
      t.integer :beds
      t.string :floor
      t.integer :building_id
      t.integer :shelter_id
      t.timestamps
    end
    add_index :units, :building_id
    add_index :units, :shelter_id
  end
end
