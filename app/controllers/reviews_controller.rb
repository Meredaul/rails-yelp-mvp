class ReviewsController < ApplicationController
  before_action :find_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to restaurant_path(@review.restaurant)
  end

  def destroy
    @review.destroy
    redirect_to reviews_path
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
