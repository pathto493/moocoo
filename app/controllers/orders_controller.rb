class OrdersController < ApplicationController
  def cart
    @orders = Order.where(user: current_user, confirmed: false)
  end

  def create
    strong_params = params.require(:product).permit(:product_id, :quantity)
    product = Product.find(strong_params[:product_id])
    quantity = strong_params[:quantity]
    order = Order.new(user: current_user, confirmed: false, quantity: quantity)
    order.product = product
    if quantity == ""
      redirect_to product_path(product)
      flash.alert = "Please insert quantity"
    elsif order.save
      redirect_to cart_path
      flash.alert = "Successfully added to cart"
    else
      redirect_to product_path(product)
      flash.alert = "You have added this to your cart already"
    end
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to cart_path
    flash.alert = "Remove items from cart"
  end
end
