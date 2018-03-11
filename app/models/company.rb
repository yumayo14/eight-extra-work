class Company < ApplicationRecord
  has_many :careers
  has_many :users, through: :careers
end
