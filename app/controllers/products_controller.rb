class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :home ]
  before_action :set_product, only: [:show, :update]

  def home
    @products = Product.all
    @brands = Brand.all
  end

  def index
    @brands = Brand.all
    @products = Product.all
    @price = Product.order('price_cents DESC')
  end

  def show
    @order = Order.new
    product = Product.find(params[:id])
    @reviews = Review.where(product: product).reverse
    @review = Review.new
    @product_photos = product.photo_id
  end

  def update
    uploaded_photos = params[:product][:photos]
    @product.photos.attach(uploaded_photos)
    redirect_to product_path(@product)
  end

  def create
    uploaded_photos = params[:product][:photos]
    @product = Product.new(product_params)
    @product.photos.attach(uploaded_photos)
    @product.save
    redirect_to product_path(@product)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
