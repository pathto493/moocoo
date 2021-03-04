class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update]

  def home
    @products = Product.all
  end

  def index
    @products = Product.all
  end

  def show
    @new_order = Order.new
  end

  def update
    uploaded_photos = params[:product][:photos]
    @product.photos.attach(uploaded_photos)
    redirect_to product_path(@product)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
