class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :events, through: :labellings
end
