class Card < ApplicationRecord
mount_uploader :image, ImageUploader
belongs_to :user
belongs_to :career, inverse_of: :card
end
