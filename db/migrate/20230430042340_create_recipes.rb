class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.integer :genre_id
      t.string :name
      t.text :introduction
      t.text :ingredient
      t.text :how_to_make

      t.timestamps
    end
  end
end
