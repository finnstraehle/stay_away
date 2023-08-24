class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :crew_members, dependent: :destroy

  CATEGORIES = ["Sailboat", "Motorboat", "Catamaran", "Yacht", "Pirate Ship", "Cargo Ship", "Inflatable Unicorn"]

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_by_category_and_location_and_guests,
                  against: [:category, :location, :guests],
                  using: {
                    tsearch: { prefix: true }
                  }
end
