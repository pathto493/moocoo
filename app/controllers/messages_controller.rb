class MessagesController < ApplicationController
  def create
    message = Message.new(params.require(:message).permit(:title, :content))
    message.user = current_user
    message.date = Time.now
    forum = Forum.find(params[:forum_id])
    message.forum = forum
    if message.save
      redirect_to forum_path(forum, anchor: "forum-anchor")
    else
      redirect_to forum_path(forum, anchor: "forum-missing"), notice: "Missing title or content"
    end
  end
end
