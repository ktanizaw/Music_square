class ArtistBoard < ApplicationRecord
  belongs_to :fan

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
