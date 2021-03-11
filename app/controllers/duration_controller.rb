class DurationController < ApplicationController
  def show
    @video = Video.find(params[:id])
    respond_to do |format|
      format.json { render json: { duration: @video.length_in_seconds } }
    end
  end
end
