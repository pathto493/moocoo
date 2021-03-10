require 'open-uri'
require 'json'

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

    # @creators = Video.order('creator ASC')
    # @likes = Video.order('likes DESC')
    # @views = Video.order('views DESC')
  end

  def show
    @video = Video.find(params[:id])
    @annotations = @video.annotations
    @order = Order.new
    @products = @annotations.map { |a| a.product }
  end

<<<<<<< HEAD
  # private

  # def filter_for(tag)
  #   results = PgSearch::multisearch(tag)

  # end

=======
  def new
    @video = Video.new
  end

  def create
    id = video_params["youtube_id"]
    if id.match?(/www.[a-z]*.com\/watch\?v=(?<y_id>[a-zA-Z0-9]{11})&[a-z]*_[a-z]*=[a-zA-Z]*/)
      its_a_match = id.match(/www.[a-z]*.com\/watch\?v=(?<y_id>[a-zA-Z0-9]{11})&[a-z]*_[a-z]*=[a-zA-Z]*/)
      yotube_id = its_a_match[:y_id]
    end
    url_one = "https://www.googleapis.com/youtube/v3/videos?part=snippet&id=#{yotube_id}&key=#{ENV['YOUTUBE_API_KEY']}"
    url_one_read = open(url_one).read
    video_info = JSON.parse(url_one_read)

    if video_info["items"] != []

      video = Video.new
      video.title = video_info['items'][0]['snippet']['title']
      video.description = video_info['items'][0]['snippet']['description']
      # video.video_url = video_info['items'][0]['snippet']['thumbnails']['default']['url']
      video.youtube_id = video_info['items'][0]['id']
      video.video_url = "https://www.youtube.com/embed/#{yotube_id}"
      video.creator = video_info['items'][0]['snippet']['channelTitle']
      video.tags = video_info['items'][0]['snippet']['tags']
      url_two = "https://www.googleapis.com/youtube/v3/videos?part=statistics&id=#{yotube_id}&key=#{ENV['YOUTUBE_API_KEY']}"
      url_two_read = open(url_two).read
      video_stats = JSON.parse(url_two_read)
      video.likes = video_stats['items'][0]['statistics']['likeCount']
      video.views = video_stats['items'][0]['statistics']['viewCount']
      video.save
      redirect_to video_path(video)
    else
      # render "pages/admin"
      redirect_to video_upload_error_path
    end
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :video_url, :video_type, :creator, :tags, :likes, :views, :youtube_id)
  end
>>>>>>> dfef38067b3b06f4e9c1279d0656380b25b83952
end
