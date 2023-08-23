class ListingsController < ApplicationController
  def index
    @listings = Boat.where(user: current_user)
  end

  def show
    @listing = Boat.find(params[:id])
  end

  def new
    @listing = Boat.new
  end

  def create
    @listing = Boat.new(listing_params)

    @listing.save
    redirect_to listing_path(@listing)

  end

  private

  def listing_params
    params.require(:boat).permit(:name, :description, :price, :location, :photo)
  end
end
