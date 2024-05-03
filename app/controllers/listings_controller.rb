class ListingsController < ApplicationController
  before_action :set_service

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_service = UserService.find_by(service: params[:service_id], user: current_user)
    if @listing.save
      redirect_to service_path(params[:service_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @bookings = @listing.bookings
  end

  private

  def set_service
    @service = Service.find(params[:service_id])
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :listing_image, :hourly_rate)
  end
end
