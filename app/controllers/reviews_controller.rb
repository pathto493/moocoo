class ReviewsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    comment_and_rating = params.require(:review).permit(:comment, :rating)
    review = Review.new(comment_and_rating)
    review.user = current_user
    review.product = product
    if review.save
      redirect_to product_path(product, anchor: "review-anchor")
    else
      redirect_to product_path(product, anchor: "review-missing"), notice: "Missing comment or rating"
    end
  end

  def edit
    @review = Review.find(params[:id])
    @user = current_user
    @product = Product.find(params[:product_id])
  end

  def update
    @review = Review.find(params[:id])
    @review.comment = params[:review].require(:comment)
    @review.rating = params[:review].require(:rating)
    @review.save
    @product = Product.find(params[:product_id])
    redirect_to product_path(@product)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product)
  end
end
