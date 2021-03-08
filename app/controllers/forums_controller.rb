class ForumsController < ApplicationController
   skip_before_action :authenticate_user!, only: [ :index, :show]
  def index
    @topics = Forum.all
  end

  def show
    @topic = Forum.find(params[:id])
    @messages = Message.where(forum: @topic).reverse
    @message = Message.new
  end
end
