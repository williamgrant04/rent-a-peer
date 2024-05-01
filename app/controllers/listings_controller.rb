class ListingsController < ApplicationController
  before_action :set_user_service, only: %i[create]

  def new
    @listing = Listing.new
  end
end
