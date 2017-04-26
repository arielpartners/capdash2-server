class Identifiers < ActiveRecord::Migration[5.0]
  def change
    create_table :identifiers do |t|
      t.string :name
      t.string :type
      t.string :code
      t.timestamps
    end
    remove_column :shelter_buildings, :case_type
    add_column :shelter_buildings, :case_type_id, :integer
    add_column :shelter_buildings, :shelter_type_id, :integer
    add_column :floors, :case_type_id, :integer
  end
end
