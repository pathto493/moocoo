class PhotosController < ApplicationController
  def destroy
    @product = Product.find(params[:product_id])
    chosen_photo = @product.photos.find(params[:id])
    chosen_photo.purge

    redirect_to product_path(@product)
  end
end
