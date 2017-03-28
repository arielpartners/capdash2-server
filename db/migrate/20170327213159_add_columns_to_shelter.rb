class AddColumnsToShelter < ActiveRecord::Migration[5.0]
  def change
    add_column :shelter_buildings, :population_group, :string
    add_column :shelter_buildings, :date_opened, :datetime
  end
end
