class MessagesController < ApplicationController

  before_action :require_user
  
  def create
    message = current_user.messages.build(message_params) #Build is similar to new - the big difference is it creates the new object and adds it to a collection of existing objects, or starts the collection.
    if message.save
      ActionCable.server.broadcast "chatroom_channel", mod_message: message_render(message)
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial: "message", locals: {message: message})
  end
end