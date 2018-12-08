class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    puts "review_params", review_params.inspect
    if @review.save
      redirect_to '/'
    end
  end

  private

  def review_params
    {
      product_id: params[:product_id],
      rating: params.require(:review)[:rating],
      description: params.require(:review)[:description]
    }
  end


end
