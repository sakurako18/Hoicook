class RecipeIngredient < ApplicationRecord
  belongs_to :recipe

    validates :ingredient, presence: true
    validates :ingredient_amount, presence: true

  def self.looks(word)
      @recipe_ingredient = RecipeIngredient.where("ingredient LIKE?","%#{word}%")
  end

end
