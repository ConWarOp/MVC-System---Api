class Postmessage < ApplicationRecord
  def self.searchmessages(postid)
    Postmessage.where("chat_id = ?",postid)
    end
  end
