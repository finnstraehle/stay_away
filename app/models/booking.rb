class Booking < ApplicationRecord
  belongs_to :boat
  belongs_to :user
  has_many :reviews, dependent: :destroy
end
