class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @services = @user.services
    @bookings = @user.bookings
    @listings = @user.listings
  end

  def profile
    @user = current_user
    @services = @user.services
    @listings = @user.listings
    @bookings = @user.bookings
  end

  def banner
    @user = current_user
    render partial: 'users/edit_banner_modal'
  end
end
