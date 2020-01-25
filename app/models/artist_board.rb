class ArtistBoard < ApplicationRecord
  has_many :fans, dependent: :destroy
  has_many :fan_users, through: :fans, source: :user
  has_many :board_comments, dependent: :destroy

  validates :artists,
    presence: true, presence: {message: "入力してください！"},
    length:{maximum: 255}

  mount_uploader :icon, IconUploader

end
