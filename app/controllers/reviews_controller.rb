class ReviewsController < ApplicationController
  def new
    @restaurants = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurants = Restaurant.find(params[:restaurant_id])
    # @review.restaurant_id = @restaurant.id
    # must belong to a restaurant in order to exist
    @review.restaurant = @restaurants
    # exclamaition mark shows errors if the instance DOESN'T save

    if @review.save!
      redirect_to restaurant_path(@restaurants)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.delete
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
