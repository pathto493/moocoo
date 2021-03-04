class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
  end

  def profile
    @user = current_user
    @watched_videos = Video.first
    @products = @user.products
    @purchased_order = Order.where(user: @user, confirmed: true)
  end

  def search
    @videos = Video
  end
end
