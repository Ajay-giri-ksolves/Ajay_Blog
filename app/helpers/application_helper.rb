module ApplicationHelper
  module ApplicationHelper
 def count_like(model)
 model.likes.where(like: true).count
 end
 def count_dislike(model)
 model.likes.where(like: false).count
 end
 end
end
