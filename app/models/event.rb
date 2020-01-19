class Event < ApplicationRecord
  validates :title,
    presence: true, presence: {message: "入力してください！"},
    length:{maximum: 32}

  validates :place,
    presence: true,presence: {message: "入力してください！"},
    length:{maximum: 32}

  validates :content,
    presence: true,presence: {message: "入力してください！"},
    length:{maximum: 255}

  validates :deadline,
    presence: true,presence: {message: "入力してください！"}
end
