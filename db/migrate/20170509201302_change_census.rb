class ChangeCensus < ActiveRecord::Migration[5.0]
  def change
    remove_column :censuses, :shelter_date
    add_column :censuses, :shelter_date, :date
    add_column :censuses, :datetime, :datetime
  end
end
