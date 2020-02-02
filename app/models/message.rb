class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation, class_name: 'Conversation', foreign_key: :conversation_id
end
