class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :require_user
  
  def create
    @message = Message.new(message_params)
    @message.gamer = current_gamer
 	if @message.save
      ActionCable.server.broadcast 'chatroom_channel',message: render_message(@message), 
      gamer: @message.gamer.gamername
    else
      render 'chatrooms/show'
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:content)
  end
  def render_message(message)
    render(partial: 'message', locals: { message: message } )
  end
end
