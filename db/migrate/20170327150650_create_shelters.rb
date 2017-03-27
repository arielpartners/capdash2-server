class CreateShelters < ActiveRecord::Migration[5.0]
  def change
    create_table :shelters do |t|
      t.string :name
      t.integer :provider_id
      t.timestamps
    end
    add_index :shelters, :provider_id
  end
end
