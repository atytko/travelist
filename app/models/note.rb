class Note < ApplicationRecord
  validates :city, presence: true
  validates :message, presence: true
  validates :city, format: { with: /[a-zA-Z]/, message: 'Please enter a valid city' }
end