class Category < ApplicationRecord
  has_many :categorizes, dependent: :destroy
  has_many :artist_boards, through: :categorizes
end
