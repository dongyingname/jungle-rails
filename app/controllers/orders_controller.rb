class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])

    @line_items = @order.line_items.order(product_id: :asc)


    products = @line_items.map{|line_item| Product.find(line_item.product_id)}
  
    @sorted_products = products.sort{|a, b| a.id - b.id}
    # puts "@Order", @order
    
    @email = @order.email
    @order_subtotal_cents = 0
    @sorted_products.each_with_index{|product, index|  @order_subtotal_cents += (product.price * @line_items[index].quantity)}
  end

  def create
    charge = perform_stripe_charge
    order  = create_order(charge)

    if order.valid?
      # @order = Order.find(params[:id])
      @order = order
       # Tell the UserMailer to send a welcome email after save
      OrderMailer.confirm_order(@order).deliver_now

      empty_cart!

      redirect_to order, notice: 'Your Order has been placed.'
    else
      redirect_to cart_path, flash: { error: order.errors.full_messages.first }
    end

  rescue Stripe::CardError => e
    redirect_to cart_path, flash: { error: e.message }
  end

  private

  def empty_cart!
    # empty hash means no products in cart :)
    update_cart({})
  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      cart_subtotal_cents,
      description: "Khurram Virani's Jungle Order",
      currency:    'cad'
    )
  end

  def create_order(stripe_charge)
    order = Order.new(
      email: session[:email],
      total_cents: cart_subtotal_cents,
      stripe_charge_id: stripe_charge.id, # returned by stripe
    )

    enhanced_cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      order.line_items.new(
        product: product,
        quantity: quantity,
        item_price: product.price,
        total_price: product.price * quantity
      )
    end
    order.save!
    order
  end

end