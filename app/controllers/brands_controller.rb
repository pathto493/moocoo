class BrandsController < ApplicationController
  def index
    @brands = Brand.all
    @products = Product.all
    @product = Product.where(brand_id: params[:id])
  end

  def show
    @brand = Brand.find(params[:id])
    @products = Product.where(brand_id: params[:id])
  end
end
