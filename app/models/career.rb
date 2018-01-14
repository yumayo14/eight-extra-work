class Career < ApplicationRecord
belongs_to :user
belongs_to :company
belongs_to :card
end
