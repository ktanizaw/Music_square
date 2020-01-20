class ArtistBoard < ApplicationRecord
  has_many :fans, dependent: :destroy

  validates :artists,
    presence: true, presence: {message: "入力してください！"},
    length:{maximum: 255}

  validates :artists,
    presence: {message: "入力してください！"},
    length:{maximum: 255}

  validates :artists,
    presence: {message: "入力してください！"},
    length:{maximum: 255}
end
