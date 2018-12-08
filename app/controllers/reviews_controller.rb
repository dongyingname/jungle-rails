class ReviewsController < ApplicationController

  def create
    @product=Product.find params[:product_id]
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product = @product

    puts "review_params", review_params.inspect
    if @review.save
      redirect_to :back
    else
      render template: "products/show"
    end
  end

  def destroy
    puts 'hahahaaaaskjdka;jsdasnd;asknd;lsand;lkasndl;akndlk;asndl;knaldknsl;dnsal;kdans;kldnslkn'

    @review = Review.find params[:id]
    @review.destroy
    redirect_to :back, notice: 'review deleted!'
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :description
    )
  
  end


end
