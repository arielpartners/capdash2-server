class AddSlugToClassifier < ActiveRecord::Migration[5.0]
  def change
    add_column :classifiers, :slug, :string
    add_index :classifiers, :slug
    remove_column :floors, :case_type_id
    remove_column :floors, :program_type_id
    remove_column :shelter_buildings, :case_type_id
    remove_column :shelter_buildings, :shelter_type_id
    remove_column :shelter_buildings, :program_type_id
    add_column :floors, :case_type_slug, :string
    add_column :floors, :program_type_slug, :string
    add_column :shelter_buildings, :case_type_slug, :string
    add_column :shelter_buildings, :shelter_type_slug, :string
    add_column :shelter_buildings, :program_type_slug, :string
  end
end
