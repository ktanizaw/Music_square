class EventComment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :content,
    presence: true, presence: {message: "入力してください！"},
    length:{maximum: 255}
end
