class ConversationsController < ApplicationController

  def create
    recipient_id = Post.find(params[:post_id]).user.id
    conversation = Conversation.new(sender_id: current_user.id,recipient_id: recipient_id)
    if conversation.save
      Message.create(user_id: recipient_id, conversation_id: conversation.id, body: params[:message_body])
      respond_to do |format|
        format.js {render partial: 'posts/contacts/success'}
      end
    else
      respond_to do |format|
        format.js {render partial: 'posts/contacts/fail'}
      end
    end
  end

end
