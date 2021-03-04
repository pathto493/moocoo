class OrdersController < ApplicationController
  def cart
    @orders = Order.where(user: current_user, confirmed: false)
  end

  def create
    product = Product.find(params[:product][:product_id])
    quantity = params[:product][:quantity]
    order = Order.new(user: current_user, confirmed: false, quantity: quantity)
    order.product = product
    if order.save
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
