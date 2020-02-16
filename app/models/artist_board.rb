class ArtistBoard < ApplicationRecord
  has_many :fans, dependent: :destroy
  has_many :fan_users, through: :fans, source: :user
  has_many :board_comments, dependent: :destroy
  has_many :categorizes, dependent: :destroy
  has_many :categories, through: :categorizes
  has_many :events, dependent: :destroy

  mount_uploader :icon, IconUploader

  scope :get_by_artists, ->(artists) {
    where("artists like ?", "%#{artists}%")
    }

  def to_param
    artists
  end
end
