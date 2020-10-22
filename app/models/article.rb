class Article < ApplicationRecord
  has_many :comments,dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image
  paginates_per 5
  #has_many :users, through :comments
#  attr_accessible :content, :name, :title
params.require(:article).permit(:name, :title, :content,:comment,:image,:avatar)
  validates :name, presence:true,:length => { :minimum => 2 },notnull: true
  validates:title, :presence =>true,
                    :length => { :minimum => 5 }
  validates :content,  :presence => true,:length => { :minimum => 10 }
  mount_uploader :cover, CoverUploader
end
