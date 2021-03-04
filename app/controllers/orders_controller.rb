class OrdersController < ApplicationController
  def cart
    @orders = Order.where(user: current_user, confirmed: false)
  end

  def create
  end

  def destroy
  end
end
