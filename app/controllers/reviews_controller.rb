class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    puts "review_params", review_params.inspect
    if @review.save
      redirect_to '/'
    end
  end

  private

  def review_params
    # puts "email", email = session[:email]
    {
      product_id: params[:product_id],
      user_id: session[:user_id],
      rating: params.require(:review)[:rating],
      description: params.require(:review)[:description]
    }
  end


end
