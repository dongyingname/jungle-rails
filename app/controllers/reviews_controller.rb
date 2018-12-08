class ReviewsController < ApplicationController

  def create
    puts "product_id", product_id = params[:product_id]
    puts "user_id",user_id = session[:user_id]
    puts "email", email = session[:email]
    puts "description", description = params.require(:review)[:description]
    puts "rating", rating = params.require(:review)[:rating]

    review_params = {
                     product_id: product_id,
                     user_id: user_id,
                     rating: rating,
                     description: description
    }
    @review = Review.new(review_params)
    if @review.save
      
      redirect_to '/'
    end



    # })
    # puts 'SAVED?', @review.save

    # @review.user = current_user
    # raise "Yay, I'm here!"
    # if @review.save
      # redirect_to '/', notice: 'Product created!'
    # else
    # render 
    # end
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end


end
