class ReviewsController < ApplicationController
  before_action :set_user_service, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.user_service = @user_service
    if @review.save
      redirect_to @user_service.service
    else
      render :new, status: :unprocessable_entity
    end
    average_rating
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end

  def set_user_service
    @user_service = UserService.find(params[:user_service_id])
  end

  def average_rating
    ratings = []
    @user_service.reviews.each { |review| ratings << review.rating }
    @user_service.average_rating = ratings.sum.fdiv(ratings.size)
    @user_service.save
  end
end
