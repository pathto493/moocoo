class AnnotationsController < ApplicationController
  def create
    raise
    @annotation_current = Annotation.find(video)
    @annotation = Annotation.new(annotation_params)
    @annotation.save
    redirect_to video_path(video)
  end

  def new
    @annotation = Annotation.new
  end

  private

  def annotation_params
    params.require(:annotation).permit(:video_id, :product_id, :time_start, :time_end)
  end
end
