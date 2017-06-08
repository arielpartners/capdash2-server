class RemoveUtilizationFromCensuses < ActiveRecord::Migration[5.0]
  def change
    remove_column :censuses, :utilization
  end
end
