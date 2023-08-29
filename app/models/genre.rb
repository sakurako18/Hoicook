class Genre < ApplicationRecord

  has_many :recipes, dependent: :destroy

  validates :genre_name, presence: true

end
