

class VideosController < ApplicationController

  def home
    @videos = Video.all
    video = Yt::Video.new id: 'nf8ySuesAPg'
    p 'pear'
    p video.published_at
  end

  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end
end
