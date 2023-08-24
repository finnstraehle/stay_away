class WishlistsController < ApplicationController
  def index
    @wishlists = Wishlist.where(user: current_user)
  end

  def new
    @wishlist = Wishlist.new
  end

  def create
    @wishlist = Wishlist.new(wishlist_params)
    @wishlist.user = current_user
    @wishlist.save
    redirect_to wishlists_path
  end
end
