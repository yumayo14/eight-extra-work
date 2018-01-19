class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  mount_uploader :avatar, ImageUploader
  has_many :telephones
  has_many :academies
  has_many :careers
  has_many :companies, through: :careers
  has_many :cards
  has_many :messages

  # one user has many follower_ids
  # userAは複数のフォロー関係を持つ
  has_many :following_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # one user has many followed_ids
  # userAは複数の被フォロー関係を持つ
  has_many :followed_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # one user has many followed_ids through following_relationships
  # userAは複数のfollowed_id(=userAがフォローしているuserid)を持つ
  has_many :following, through: :following_relationships, source: :followed
  # one user has many follower_ids through followed_relationships
  # userAは複数のfollower_id(=userAをフォローしているuserid)を持つ
  has_many :followers, through: :followed_relationships, source: :follower

  # 今回は双方向のフォロー関係を同時に設定
  def follow(own_user,other_user)
    following_relationships.create(followed_id: other_user.id)
    other_user.following_relationships.create(followed_id: own_user.id)
  end

  def unfollow(own_user,other_user)
    following_relationships.find_by(followed_id: other_user.id).destroy
    other_user.following_relationships.find_by(followed_id: own_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
