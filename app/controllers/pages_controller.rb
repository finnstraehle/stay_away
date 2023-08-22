class PagesController < ApplicationController
  def home
    @boat = Boat.new
  end
end
