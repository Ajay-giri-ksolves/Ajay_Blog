class Article < ApplicationRecord
  has_many :comments,dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image
  paginates_per 5
  #has_many :users, through :comments
  validates :name, presence:true,:length => { :minimum => 2 }
  validates:title, :presence =>true,
                    :length => { :minimum => 5 }
  validates :content,  :presence => true,:length => { :minimum => 10 }
  def image_thumbnail
    if image.attached?
    image.variant(resize_to_limit: [300,300])
    end
  end
end
