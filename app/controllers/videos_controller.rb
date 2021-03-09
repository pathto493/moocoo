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
    # if params[:q].nil? || params[:q] == ""
    @videos = Video.all
    # else
    #   @videos = Video.search_by_video_title_and_tags(params[:q])
    # end
    @creators = Video.order('creator ASC')
    @likes = Video.order('likes DESC')
    @views = Video.order('views DESC')
  end

  def show
    @video = Video.find(params[:id])
    @annotations = @video.annotations
    @order = Order.new
    @products = @annotations.map { |a| a.product }
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @Video.save
    redirect_to video_path(@video)
  end

  private

  def video_params
    params.require(:video).permit(:youtube_id)
  end
end
