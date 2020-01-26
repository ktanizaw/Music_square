class Categorize < ApplicationRecord
  belongs_to :category
  belongs_to :artist_board
end
