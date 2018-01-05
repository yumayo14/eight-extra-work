class Telephone < ApplicationRecord
  belongs_to :user
  belongs_to :telephone_type
end
