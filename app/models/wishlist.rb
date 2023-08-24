class Wishlist < ApplicationRecord
  belongs_to :boat
  belongs_to :user
end
