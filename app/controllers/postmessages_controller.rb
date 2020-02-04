class PostmessagesController < ApplicationController
  def new
    @postmessage=Postmessage.new
  end

  def create
    @postmessage=Postmessage.create(msg_params)
    if @postmessage.save
      ActionCable.server.broadcast 'room_channel', content: @postmessage.content , sender_id: @postmessage.sender_id
    end
  end

private

  def msg_params
    params.require(:postmessage).permit(:chat_id,:content,:sender_id)
  end
end
