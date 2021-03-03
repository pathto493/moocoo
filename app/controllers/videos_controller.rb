class VideosController < ApplicationController

  def home
    @videos = Video.all
  end

  def index
    if params[:q].nil?
      @videos = Video.all
    else
      @videos = Video.search_by_video_title_and_tags(params[:q])
    end
  end

  def show
    @video = Video.find(params[:id])
  end
end
