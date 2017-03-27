class AddSurgeBedsToShelterBuildings < ActiveRecord::Migration[5.0]
  def change
    add_column :shelter_buildings, :surge_beds, :integer
  end
end
