class ChangeAddresses < ActiveRecord::Migration[5.0]
  def change
    change_table :addresses do |t|
      t.rename :street_address1, :street_number
      t.rename :street_address2, :street_name
      t.integer :borough
    end
  end
end
