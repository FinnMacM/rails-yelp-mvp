class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.build(review_params)

    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Review was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@restaurant), status: :see_other, notice: 'Review was successfully deleted.'
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
