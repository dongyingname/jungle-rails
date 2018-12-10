require 'rails_helper'

RSpec.describe Product, type: :model do

  before :each do
    @category = Category.new(name: 'Toy')
    @product = Product.new(
      name: 'Product1_name',
      price: 250,
      quantity: 35,
      category: @category
    )
  end 

  describe 'Validations' do
    
    it "is valid with valid attributes" do 
      expect(@product).to be_valid
    end

    it "should have a name" do
      @product.name = nil
      expect(@product).to be_invalid
    end

    it "should have a price" do
      @product.price_cents= nil
      expect(@product).to be_invalid
    end

    it "should have a category" do
      @product.category = nil
      expect(@product).to be_invalid
    end
    
    it "should have a quantity" do
      @product.quantity = nil
      expect(@product).to be_invalid
    end

  end
end
