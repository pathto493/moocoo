class OrdersController < ApplicationController
  def cart
    @orders = Order.where(user: current_user, confirmed: false)

    @total_price = 0
    @orders.each do |order|
      @total_price += order.quantity * order.product.price
    end
  end

  def create
    strong_params = params.require(:product).permit(:product_id, :quantity)
    product = Product.find(strong_params[:product_id])
    quantity = strong_params[:quantity].exist? ? strong_params[:quantity] : 1 # Check if quantity exists
    order = Order.new(user: current_user, confirmed: false, quantity: quantity)
    order.product = product

    # Check orders exist already?
    other_orders = current_user.orders.where(confirmed: false)
    bad_cart = other_orders.find { |order| order.user_id == self.user_id && order.product_id == self.product_id }
    if self.confirmed == false && bad_cart

    end

    if order.save
      # redirect_to cart_path
      # flash.alert = "Successfully added to cart"
    else
      # redirect_to product_path(product)
      # flash.alert = "You have added this to your cart already"
    end
    render json: order
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to cart_path
    flash.alert = "Remove items from cart"
  end
end
