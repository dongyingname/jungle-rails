class ReviewsController < ApplicationController

  def create
    @product=Product.find params[:product_id]
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product = @product

    puts "review_params", review_params.inspect
    if @review.save
      redirect_to '/'
    else
      render template: "products/show"
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
