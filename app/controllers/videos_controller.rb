class VideosController < ApplicationController

  def home
    @videos = Video.all
    video = Yt::Video.new id: 'nf8ySuesAPg'
    url_one = "https://www.googleapis.com/youtube/v3/videos?part=snippet&id=nf8ySuesAPg&key=#{ENV['YOUTUBE_API_KEY_NEW']}"
    # url = "https://www.googleapis.com/youtube/v3/videos?part=statistics&id=nf8ySuesAPg&key=#{ENV['YOUTUBE_API_KEY_NEW']}"
    url_one_read = open(url_one).read
    video_info = JSON.parse(url_one_read)
    # p video_info['items'][0]['snippet']['thumbnails']
    video = Video.new
    video.title = video_info['items'][0]['snippet']['title']
    video.description = video_info['items'][0]['snippet']['description']
    video.video_url = video_info['items'][0]['snippet']['thumbnails']['default']['url']
    video.creator = video_info['items'][0]['snippet']['channelTitle']
    video.tags = video_info['items'][0]['snippet']['tags']
    p video.title
    p video.description
    p video.video_url
    p video.creator
    url_two = "https://www.googleapis.com/youtube/v3/videos?part=statistics&id=nf8ySuesAPg&key=#{ENV['YOUTUBE_API_KEY_NEW']}"
    url_two_read = open(url_two).read
    video_stats = JSON.parse(url_two_read)
    video.likes = video_stats['items'][0]['statistics']['likeCount']
    video.views = video_stats['items'][0]['statistics']['viewCount']
    p video.likes
    p video.views
  end

  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end
end
