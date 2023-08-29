class Recipe < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipe_tag_relations, dependent: :destroy
  has_many :tags, through: :recipe_tag_relations, dependent: :destroy
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true

  validates :recipe_name, presence: true
  validates :introduction, presence: true
  validates :number_of_people, presence: true
  validates :how_to_make, presence: true
  validates :post_status, inclusion: {in: [true, false]}
  validates :genre_id, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(word)
      @recipe = Recipe.where("name LIKE?","%#{word}%")
  end

end
