class ServicesController < ApplicationController
  def index
    @services = Service.all
    @top_rated = User.all # Fix this when we implement ratings

    if params[:service].present?
      @services = Service.where("name ILIKE ?", "%#{params[:service]}%")
    end
  end

  def show
    @service = Service.find(params[:id])
    @listings = Listing.where(user_service: UserService.where(service: @service))
  end
end
