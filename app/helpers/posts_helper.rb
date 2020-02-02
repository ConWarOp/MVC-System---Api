module PostsHelper

  def leave_message_partial_path
    if @message_has_been_sent
      'posts/contacts/already_in_touch'
    else
      'posts/contacts/message_form'
    end
  end
end
