class Admin::CategoriesController < ApplicationController

  include AdminAuthConcern
  
  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new

  end
  
  def create
    # puts "params///////////////////",category_params
    @category = Category.new(category_params)
    
    if @category.save
      redirect_to [:admin, :categories], notice: 'category created!'
    else
      render :new
    end
  end

  def category_params
    params.require(:category).permit(
      :name
    )
  end

  
end
