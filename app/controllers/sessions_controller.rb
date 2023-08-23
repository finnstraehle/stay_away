class SessionsController < ApplicationController
  skip_before_action :authorize, only: :create

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in"
    else
      flash.now.alert = "Name not found, sorry."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully"
  end
end
