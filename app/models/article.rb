class Article < ApplicationRecord
  has_many :comments,dependent: :destroy
  #has_many :users, through :comments
  attr_accessible :content, :name, :title
  validates :name, presence:true,:length => { :minimum => 2 },notnull: true
  validates:title, :presence =>true,
                    :length => { :minimum => 5 }
  validates :content,  :presence => true,:length => { :minimum => 10 }
  mount_uploader :cover, CoverUploader


end
