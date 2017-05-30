class ChangeAuthorToEnteredBy < ActiveRecord::Migration[5.0]
  def change
    rename_column :censuses, :author, :entered_by
  end
end
