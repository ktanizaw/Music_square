class Contact < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: { message: 'に不備があります。' }, format: { with: VALID_EMAIL_REGEX }
  validates :message, presence: true
end
