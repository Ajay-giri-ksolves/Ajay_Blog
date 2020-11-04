class Comment < ApplicationRecord
  validate :image_accepted
  belongs_to :article
  belongs_to :user
  has_one_attached :comment_image

  def comment_image_thumbnail
    if comment_image.attached?
    comment_image.variant(resize_to_limit: [100,100])
    end
  end
  def image_accepted
    return unless comment_image.attached?
    unless comment_image.byte_size <= 1.megabyte
    errors.add(:comment_image, "is too big")
    end

    acceptable_types = ["image/jpg", "image/png"]
    unless acceptable_types.include?(comment_image.content_type)
    errors.add(:comment_image, "must be a JPG or PNG")
    end
  end
end
