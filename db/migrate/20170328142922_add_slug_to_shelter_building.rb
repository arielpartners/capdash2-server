class AddSlugToShelterBuilding < ActiveRecord::Migration[5.0]
  def change
    add_column :shelter_buildings, :slug, :string
  end
end
