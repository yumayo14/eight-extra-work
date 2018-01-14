class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  mount_uploader :avatar, AvatarUploader
  has_many :telephones
  has_many :academies
  has_many :careers
  has_many :companies, through: :careers
  has_many :cards
end
