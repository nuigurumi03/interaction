class MessagesController < ApplicationController

  def create
    message = Message.create(message_params)
    redirect_to post_path(message.post.id)
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
