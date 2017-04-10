class Createplaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :type
      t.integer :compartment_id
      t.integer :compartment_type
      t.integer :bed_count
      t.timestamps
    end
    drop_table :beds
    drop_table :units
    add_index :places, [:compartment_id, :compartment_type]
  end
end
