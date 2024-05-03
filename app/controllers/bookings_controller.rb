class BookingsController < ApplicationController
  before_action :find_booking, only: %i[show edit update destroy]
  before_action :get_service_listing, only: %i[show new create]

  def show
    @user = User.find(@booking.user_id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.listing = @listing
    @booking.user = current_user # 'Buyer' user is current user

    if @booking.save
      redirect_to service_listing_booking_path(@service, @listing, @booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    @booking.accepted = true
    @booking.save
  end

  def destroy
    @booking.destroy
    redirect_to profile_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def get_service_listing
    @service = Service.find(params[:service_id])
    @listing = Listing.find(params[:listing_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
