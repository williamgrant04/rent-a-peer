class BookingsController < ApplicationController
  before_action :find_booking, only: %i[edit update destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params.except(:listing_id, :user_id))
    @booking.listing = Listing.find(booking_params[:listing_id])
    @booking.user = current_user # 'Buyer' user is current user

    debugger
  end

  def edit

  end

  def update
    debugger
  end

  def destroy
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :listing_id)
  end
end
