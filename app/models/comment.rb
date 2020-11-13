class Comment < ApplicationRecord
  validate :image_accepted
  belongs_to :article
  belongs_to :user
end
