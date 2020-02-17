class BoardComment < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  belongs_to :artist_board

  validates :content, presence: true, length: { maximum: 255 }

  mount_uploader :picture, PictureUploader
end
