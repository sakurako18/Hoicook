class Recipe < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  # belongs_to :admin
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipe_tag_relations, dependent: :destroy
  has_many :tags, through: :recipe_tag_relations, dependent: :destroy
  # has_many :how_to_makes, dependent: :destroy
  # accepts_nested_attributes_for :recipe_ingredients, :how_to_makes, allow_destroy: true
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true

  validates :name, presence: true


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(word)
      @recipe = Recipe.where("name LIKE?","%#{word}%")
  end

end
