class AddDescriptionToCocktails < ActiveRecord::Migration[7.1]
  def change
    add_column :cocktails, :description, :string
  end
end
