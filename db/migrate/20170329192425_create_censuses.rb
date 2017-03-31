class CreateCensuses < ActiveRecord::Migration[5.0]
  def change
    create_table :censuses do |t|
      t.integer :shelter_building_id
      t.datetime :observed_for
      t.integer :count
      t.timestamps
    end
    add_index :censuses, :shelter_building_id
  end
end
