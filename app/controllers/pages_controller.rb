class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @boat = Boat.new
  end

  def dashboard
  end

  def map
    @boats = Boat.all
    @markers = @boats.geocoded.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude,
        info_window_html: render_to_string(
          partial: "info_window",
          locals: {
            boat: boat,
            reviews_average: if Review.where(booking: Booking.where(boat: boat)).empty?
                               "no reviews"
                             else
                               Review.where(booking: Booking.where(boat: boat)).average(:rating).round(2)
                             end
          }
        ),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end
end
