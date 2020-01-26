class ArtistBoard < ApplicationRecord
  has_many :fans, dependent: :destroy
  has_many :fan_users, through: :fans, source: :user
  has_many :board_comments, dependent: :destroy
  has_many :categorizes, dependent: :destroy
  has_many :categories, through: :categorizes

  validates :artists,
    presence: true, presence: {message: "入力してください！"},
    length:{maximum: 255}

  mount_uploader :icon, IconUploader

  scope :get_by_artists, ->(artists) {
    where("artists like ?", "%#{artists}%")
    }

end
