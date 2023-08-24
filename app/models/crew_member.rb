class CrewMember < ApplicationRecord
  belongs_to :boat

  has_one_attached :photo
end
