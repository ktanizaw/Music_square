class Event < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id

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

  mount_uploader :image, ImageUploader
end
