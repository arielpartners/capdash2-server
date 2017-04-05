class AddToUnits < ActiveRecord::Migration[5.0]
  def change
  	add_column :units, :placement_type, :string
  	add_column :units, :status, :string
  end
end
