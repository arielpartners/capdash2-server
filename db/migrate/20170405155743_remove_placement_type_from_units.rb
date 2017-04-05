class RemovePlacementTypeFromUnits < ActiveRecord::Migration[5.0]
  def change
    remove_column :units, :placement_type
  end
end
