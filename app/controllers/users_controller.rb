class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @services = @user.services
    @bookings = @user.bookings
    @listings = @user.listings
    @reviews = []
    @user.user_services.each do |us|
      us.reviews.each do |review|
        @reviews << review
      end
    end
  end

  def profile
    @user = current_user
    @services = @user.user_services
    @listings = @user.listings
    @bookings = @user.bookings
    @reviews = @user.reviews
    # @services.each do |us|
    #   @reviews << us.reviews
    # end
    # @reviews
  end

  def banner
    @user = current_user
    render partial: 'users/edit_banner_modal'
  end
end
