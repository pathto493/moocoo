class VideosController < ApplicationController
  def home
    @videos = Video.all
    @videos_one = @videos[0]
    @videos_two = @videos[1]
    @videos_three = @videos[2]
    @videos_four = @videos[3]
    @videos_five = @videos[4]
    @videos_six = @videos[5]
    @videos_seven = @videos[6]
    @videos_eight = @videos[7]
    @videos_nine = @videos[8]
  end

  def index
    @videos = Video.all
  end

  def show
    @videos = Video.all
  end
end
