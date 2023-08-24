class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :crew_members, dependent: :destroy
  has_many :wishlists, dependent: :destroy

  has_many_attached :photos

  CATEGORIES = ["Sailboat", "Motorboat", "Catamaran", "Yacht", "Pirate Ship", "Cargo Ship", "Inflatable Unicorn"]

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
