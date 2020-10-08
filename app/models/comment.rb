class Comment < ApplicationRecord
  belongs_to :article
  attr_accessible :body, :user_id
end
