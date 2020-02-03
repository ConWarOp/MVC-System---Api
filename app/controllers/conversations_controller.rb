class ConversationsController < ApplicationController

  def create
    recipient_id = Post.find(params[:post_id]).user.id
    conversation = Conversation.new(sender_id: current_user.id,recipient_id: recipient_id)
    if conversation.save
      Message.create(user_id: recipient_id, conversation_id: conversation.id, body: params[:message_body])
      session[:conversations] ||= []
      #@users = User.all.where.not(id: current_user)
      @conversations = Conversation.includes(:recipient, :messages).find(session[:conversations])
    end
  end

  private

  def add_to_conversations
    session[:conversations] ||= []
    session[:conversations] << @conversation.id
  end
  def conversated?
    session[:conversations].include?(@conversation.id)
  end

end
