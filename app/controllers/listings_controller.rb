class ListingsController < ApplicationController
  def index
    @listings = Boat.where(user: current_user)
  end

  def show
    @listing = Boat.find(params[:id])
  end
end
