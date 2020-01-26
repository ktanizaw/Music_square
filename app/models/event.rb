class Event < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :participants, dependent: :destroy
  has_many :participant_users, through: :participants, source: :user
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings

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

  scope :get_by_title, ->(title) {
    where("title like ?", "%#{title}%")
    }
end
