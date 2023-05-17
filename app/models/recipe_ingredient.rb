class RecipeIngredient < ApplicationRecord
  belongs_to :recipe

    validates :ingredient, presence: true
    validates :ingredient_amount, presence: true

# 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @ingredient = RecipeIngredient.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @ingredient = RecipeIngredient.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @ingredient = RecipeIngredient.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @ingredient = RecipeIngredient.where("title LIKE?","%#{word}%")
    else
      @ingredient = RecipeIngredient.all
    end
  end

end
