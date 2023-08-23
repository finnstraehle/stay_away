class ListingsController < ApplicationController
  def index
    @listings = Boat.where(user: current_user)
  end

  def show
    @listing = Boat.find(params[:id])
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to listings_path, status: :see_other
  end

  private

  def listing_params
    params.require(:boat).permit(:name, :description, :price, :location, :category, :guests)
  end
end
