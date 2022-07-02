class Blog < ApplicationRecord
  include SlugConcern

  has_one_attached :desktop_image
  has_one_attached :mobile_image

  validates :title,
    :content,
    :keywords,
    :meta_description,
    :auther_name,
    :publish_date, presence: true
end
