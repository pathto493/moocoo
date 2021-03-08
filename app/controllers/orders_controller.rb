class OrdersController < ApplicationController
  def cart
    @orders = Order.where(user: current_user, confirmed: false)

    @total_price = 0
    @orders.each do |order|
      @total_price += order.quantity * order.product.price
    end

    respond_to do |format|
      format.html
      format.json { render json: @total_price }
    end
  end

  def create
    strong_params = params.require(:product).permit(:product_id, :quantity)
    product = Product.find(strong_params[:product_id])
    quantity = strong_params[:quantity] || 1 # Check if quantity exists
    order = Order.new(user: current_user, confirmed: false, quantity: quantity)
    order.product = product

    # Check orders exist already?
    other_orders = current_user.orders.where(confirmed: false)
    same_order = other_orders.find { |o| o.user == current_user && o.product_id == order.product_id }
    if order.confirmed == false && same_order
      same_order.quantity += quantity
      same_order.save
      order.destroy
      order = same_order
    else
      order.save
    end
  end

  def vidcreateorder
    product_id = params.require(:order).require(:product)
    quantity_zero = params.require(:order).permit(:quantity).values.join
    if quantity_zero == ""
      return
    else
      quantity = params.require(:order).require(:quantity).to_i
      product = Product.find(product_id)

      # Check orders exist already?
      order = Order.new(user: current_user, confirmed: false, quantity: quantity, product: product)
      other_orders = current_user.orders.where(confirmed: false)
      same_order = other_orders.find { |o| o.user == current_user && o.product_id == order.product_id }
      if order.confirmed == false && same_order
        same_order.quantity += quantity
        same_order.save
        order.destroy
        order = same_order
      else
        order.save
      end
    end
    render json: order
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    #redirect_to cart_path
    #flash.alert = "Remove items from cart"
  end
end
