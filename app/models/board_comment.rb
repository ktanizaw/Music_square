class BoardComment < ApplicationRecord
  belongs_to :user
  belongs_to :artist_board

  validates :content,
    presence: true, presence: {message: "入力してください！"},
    length:{maximum: 255}

end
