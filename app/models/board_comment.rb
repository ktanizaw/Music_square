class BoardComment < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  belongs_to :artist_board

  validates :content,
    presence: true, presence: {message: "入力してください！"},
    length:{maximum: 255}

  def favorite_user(user_id)
    favorites.find_by(user_id: user_id)
  end

  mount_uploader :picture, PictureUploader
end
