class User < ApplicationRecord
  acts_as_voter
  has_many :likes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :comments
  has_one_attached :avatar
  def avatar_thumbnail
     if avatar.attached?
    avatar.variant(resize_to_limit: [40, 40])
    else
    '/default_profile.jpg'
  end
end
end
