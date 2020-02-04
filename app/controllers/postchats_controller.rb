class PostchatsController < ApplicationController

  def index
    @postmessages = Postmessage.searchmessages(params[:postid])
    @postmessage = Postmessage.new
  end



end
