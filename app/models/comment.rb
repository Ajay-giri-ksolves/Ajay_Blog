class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  #attr_accessible :body, :user_id
end
