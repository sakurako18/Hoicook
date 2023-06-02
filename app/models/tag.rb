class Tag < ApplicationRecord

  has_many :recipe_tag_relations, dependent: :destroy
  has_many :tweets, through: :recipe_tag_relations, dependent: :destroy

end
