class ChangeAddressesBack < ActiveRecord::Migration[5.0]
  def change
    rename_column :addresses, :street_number, :line1
    rename_column :addresses, :street_name, :line2
  end
end
