class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
    @crew_members = CrewMember.where(boat: @boat)
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
      redirect_to boats_path
    else
      render :edit
    end
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to boats_path, status: :see_other
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :location, :guests, :description, :price, :category)
  end
end
