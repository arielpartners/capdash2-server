class AddAuthorToCensus < ActiveRecord::Migration[5.0]
  def change
    add_column :censuses, :author, :string
  end
end
