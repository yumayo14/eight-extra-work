class Career < ApplicationRecord
belongs_to :user
belongs_to :company
has_one :card, inverse_of: :career
accepts_nested_attributes_for :card
end
