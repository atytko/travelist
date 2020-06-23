class Note < ApplicationRecord
    validates :city, presence: true
    validates :message, presence: true
end
