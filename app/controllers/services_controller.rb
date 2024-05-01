class ServicesController < ApplicationController
  def index
    @services = Service.all
    @top_rated = User.all # Fix this when we implement ratings
  end

  def show
    @service = Service.find(params[:id])
    @listings = Listing.where(user_service: UserService.find_by(service: @service))
  end
end
