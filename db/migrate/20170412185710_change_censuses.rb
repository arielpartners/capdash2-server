class ChangeCensuses < ActiveRecord::Migration[5.0]
  def change
    remove_column :censuses, :observed_for
    add_column :censuses, :shelter_date, :string
  end
end
