class ArtistBoard < ApplicationRecord
  has_many :fans, dependent: :destroy
  has_many :board_comments, dependent: :destroy
  belongs_to :user

  validates :artists,
    presence: true, presence: {message: "入力してください！"},
    length:{maximum: 255}

  validates :artists,
    presence: {message: "入力してください！"},
    length:{maximum: 255}

  validates :artists,
    presence: {message: "入力してください！"},
    length:{maximum: 255}

  mount_uploader :icon, IconUploader
end
