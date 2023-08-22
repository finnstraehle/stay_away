class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :crew_members, dependent: :destroy

  CATEGORIES = ["Sailboat", "Motorboat", "Catamaran", "Yacht", "Pirate Ship", "Cargo Ship", "Inflatable Unicorn"]
end
