class CreateRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe, null: false, foreign_key: true
      t.text :ingredient
      t.text :ingredient_amount
      t.timestamps

      # ing_name:string
      # quantity:string
    end
  end
end
