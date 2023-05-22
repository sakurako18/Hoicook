class RecipeIngredient < ApplicationRecord
  belongs_to :recipe

    validates :ingredient, presence: true
    validates :ingredient_amount, presence: true

  def self.looks(search, word)
    if search == "perfect_match"
      @recipe_ingredient = RecipeIngredient.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @recipe_ingredient = RecipeIngredient.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @recipe_ingredient = RecipeIngredient.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @recipe_ingredient = RecipeIngredient.where("title LIKE?","%#{word}%")
    else
      @recipe_ingredient = RecipeIngredient.all
    end
  end

end
