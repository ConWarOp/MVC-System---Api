class ChatsController < ApplicationController
  def index
    @messages = Message.searchmessages(current_user.user_id, request.query_parameters["receiverid"]).select("content,sender_id")
    @message = Message.new
  end
end
