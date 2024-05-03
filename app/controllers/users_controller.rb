class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @services = @user.services
    @bookings = @user.bookings
    @listings = @user.listings
  end

  def profile
    @user = current_user
    @services = @user.user_services
    @listings = @user.listings
    @bookings = @user.bookings
    @reviews = []
    @services.each do |us|
      @reviews << us.reviews
    end
  end

  def banner
    @user = current_user
    render partial: 'users/edit_banner_modal'
  end
end
