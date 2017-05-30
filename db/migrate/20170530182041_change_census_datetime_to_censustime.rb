class ChangeCensusDatetimeToCensustime < ActiveRecord::Migration[5.0]
  def change
    rename_column :censuses, :datetime, :census_time
  end
end
