class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @boat = Boat.new
  end

  def dashboard
  end
end
