class Post < ApplicationRecord
  belongs_to :user
  validates :text_or_image, presence: true

  private
  def text_or_image
    text.presence or image.presence
  end
end
