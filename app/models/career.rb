class Career < ApplicationRecord
belongs_to :user
belongs_to :company
has_one :card
end
