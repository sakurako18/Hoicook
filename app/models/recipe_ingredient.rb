class RecipeIngredient < ApplicationRecord
  belongs_to :recipe

    validates :ingredient, presence: true
    validates :ingredient_amount, presence: true
end
