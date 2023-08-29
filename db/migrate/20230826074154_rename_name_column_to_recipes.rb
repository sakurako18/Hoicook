class RenameNameColumnToRecipes < ActiveRecord::Migration[6.1]
  def change
      rename_column :recipes, :name, :recipe_name
  end
end
