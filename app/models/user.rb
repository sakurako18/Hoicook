class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :recipes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.guest
    find_or_create_by!(email: 'aaa@aaa.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.user_name = 'ゲストユーザー'
      user.last_name = 'サンプル'
      user.first_name = '太郎'
    end
  end

end
