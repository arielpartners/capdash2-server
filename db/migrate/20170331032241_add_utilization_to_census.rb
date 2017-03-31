class AddUtilizationToCensus < ActiveRecord::Migration[5.0]
  def change
    add_column :censuses, :utilization, :float
  end
end
