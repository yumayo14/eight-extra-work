class Card < ApplicationRecord
mount_uploader :image, ImageUploader
belongs_to :user
has_one :career
end
