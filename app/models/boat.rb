class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :crew_members
end
