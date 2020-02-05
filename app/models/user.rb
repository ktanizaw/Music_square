class User < ApplicationRecord
  has_many :fans, dependent: :destroy
  has_many :fan_artistboards, through: :fans, source: :artist_board
  has_many :favorites, dependent: :destroy
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :board_comments, dependent: :destroy
  has_many :artist_boards
  has_many :events, dependent: :destroy, foreign_key: :owner_id
  has_many :event_comments, dependent: :destroy
  has_many :participants, dependent: :destroy


  validates :name,
    presence: true, presence: {message: "入力してください！"},
    uniqueness: true, length:{maximum: 24}

  before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
      presence: true, presence: {message: "入力してください！"},
      uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  validates :profile,
    length:{maximum: 255}

  mount_uploader :profile_image, ProfileImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def already_favorite?(favorite_boardcomment)
    self.favorites.exists?(board_comment_id: favorite_boardcomment.id)
  end

  def self.find_for_oauth(auth)
  user = User.where(uid: auth.uid, provider: auth.provider).first

  unless user
    user = User.create(
      name: auth.info.name,
      uid:      auth.uid,
      provider: auth.provider,
      email:    auth.info.email,
      profile_image: auth.info.image,
      password: Devise.friendly_token[0, 20]
    )
  end
  user
end
end
