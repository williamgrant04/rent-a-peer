class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    debugger
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    debugger
  end

  def destroy
    @booking = Booking.find(params[:id])
  end
end
