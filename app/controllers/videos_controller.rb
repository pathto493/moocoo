class VideosController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :home ]

  def home
    @videos = Video.all
    videos_trending = Video.all
    @video_t1 = videos_trending[0]
    @video_t2 = videos_trending[1]
    @video_t3 = videos_trending[2]
    @video_t4 = videos_trending[3]
    @video_t5 = videos_trending[4]
  end

  def index
    @videos = Video.all

    @creators = Video.order('creator ASC')
    @likes = Video.order('likes DESC')
    @views = Video.order('views DESC')
  end

  def filter_videos
    @eyes = Video.search_by_video_title_and_tags("eyes")
    @foundation = Video.search_by_video_title_and_tags("foundation")
    @lips = Video.search_by_video_title_and_tags("lips")
  end

  def show
    @video = Video.find(params[:id])
    @annotations = @video.annotations
    @order = Order.new
    @products = @annotations.map { |a| a.product }
  end

  # private

  # def filter_for(tag)
  #   results = PgSearch::multisearch(tag)

  # end

end
