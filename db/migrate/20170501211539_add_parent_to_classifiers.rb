class AddParentToClassifiers < ActiveRecord::Migration[5.0]
  def change
    add_column :classifiers, :parent_id, :integer
  end
end
