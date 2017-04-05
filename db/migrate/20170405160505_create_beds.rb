class CreateBeds < ActiveRecord::Migration[5.0]
  def change
    create_table :beds do |t|
      t.integer :floor_id
      t.string :name
      t.string :status
      t.timestamps
    end
  end
end
