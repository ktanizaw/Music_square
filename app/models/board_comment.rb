class BoardComment < ApplicationRecord
  validates :content,
    presence: true, presence: {message: "入力してください！"},
    length:{maximum: 255}
end
