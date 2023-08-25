class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :boats, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :received_bookings, through: :boats, source: :bookings
  has_many :reviews, through: :bookings, dependent: :destroy
  has_many :wishlists, dependent: :destroy

  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
