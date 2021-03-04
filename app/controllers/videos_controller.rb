class VideosController < ApplicationController

  def home
    @videos = Video.all
    videos_trending = Video.all
    @video_t1 = videos_trending[0]
    @video_t2 = videos_trending[1]
    @video_t3 = videos_trending[2]
    @video_t4 = videos_trending[3]
    @video_t5 = videos_trending[4]
  end

  def show
    @video = Video.find(params[:id])

  def index
    if params[:q].nil? || params[:q] == ""
      @videos = Video.all
    else
      @videos = Video.search_by_video_title_and_tags(params[:q])
    end
  end

  def show
    @video = Video.find(params[:id])
    @products = Product.all
    @order = Order.new
  end
end
