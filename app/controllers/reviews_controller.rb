class ReviewsController < ApplicationController

  def create
    
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product = Product.find params[:product_id]

    puts "review_params", review_params.inspect
    if @review.save
      redirect_to '/'
    end
  end

  private

  def review_params

    params.require(:review).permit(
      :rating,
      :description
    )
  
  end


end
