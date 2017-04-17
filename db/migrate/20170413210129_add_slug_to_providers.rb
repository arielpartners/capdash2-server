class AddSlugToProviders < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :slug, :string
    add_index :providers, :slug
  end
end
