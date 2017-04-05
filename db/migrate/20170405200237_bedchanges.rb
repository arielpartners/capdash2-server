class Bedchanges < ActiveRecord::Migration[5.0]
  def change
    remove_column :beds, :name
    add_column :beds, :number, :integer
    add_column :shelter_buildings, :building_id, :integer
  end
end
