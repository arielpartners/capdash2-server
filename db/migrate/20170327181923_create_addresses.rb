class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street_address1
      t.string :street_address2
      t.string :city
      t.string :state
      t.string :zip
      t.timestamps
    end
    remove_column :shelter_buildings, :address
    add_column :shelter_buildings, :address_id, :integer
    add_index :shelter_buildings, :address_id
  end
end
