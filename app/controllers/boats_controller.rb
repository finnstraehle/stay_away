class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @boats = Boat.all

    @guests = params[:guests].to_i
    @boats = Boat.where(guests: guests_range)

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

  def show
    @boat = Boat.find(params[:id])
    @crew_members = CrewMember.where(boat: @boat)
    @booking = Booking.new
    @booking_of_boat = Booking.where(boat: @boat)
    @reviews = Review.where(booking: @booking_of_boat)
    @reviews_average = @reviews.average(:rating).round(2) if @reviews.empty? == false
    @reviews_average = "no reviews" if @reviews.empty?
    @reviews_count = @reviews.count

    @markers = [
      {
        lat: @boat.latitude,
        lng: @boat.longitude,
        info_window_html: render_to_string(
          partial: "info_window",
          locals: {
            boat: @boat,
            reviews_average: if Review.where(booking: Booking.where(boat: @boat)).empty?
                               "no reviews"
                             else
                               Review.where(booking: Booking.where(boat: @boat)).average(:rating).round(2)
                             end
          }
        ),
        marker_html: render_to_string(partial: "marker")
      }
    ]
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    if @boat.save
      redirect_to listings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
    if @boat.update(boat_params)
      redirect_to listings_path
    else
      render :edit
    end
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to boats_path, status: :see_other
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

  private

  def boat_params
    params.require(:boat).permit(:name, :location, :guests, :description, :price, :category, photos: [])
  end

  def guests_range
    ((@guests)..(@guests + 2))
  end
end
