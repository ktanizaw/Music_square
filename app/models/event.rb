class Event < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  belongs_to :artist_board
  has_many :participants, dependent: :destroy
  has_many :participant_users, through: :participants, source: :user
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
  has_many :event_comments, dependent: :destroy

  validates :title, presence: { message: 'を入力してください。' }, length: { maximum: 32 }
  validates :place, presence: { message: 'を入力してください。' }, length: { maximum: 32 }
  validates :content, presence: { message: 'を入力してください。' }, length: { maximum: 255 }
  validates :deadline, presence: { message: 'を入力してください。' }

  mount_uploader :image, ImageUploader

  scope :get_by_title, ->(title) {
    where('title like ?', "%#{title}%")
  }
end
