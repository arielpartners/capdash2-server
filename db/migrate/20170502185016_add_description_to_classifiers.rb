class AddDescriptionToClassifiers < ActiveRecord::Migration[5.0]
  def change
    add_column :classifiers, :description, :text
  end
end
