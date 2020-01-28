class PagesController < ApplicationController
	def home

	end
        def index
          @posts = Post.limit(5)
        end
	def addfriend
		if params[:search].present?
      @userbyemail = User.find_by_email(params[:search])
			#helpers.link_to friendships_path(:friend_id => @userbyemail.id), :method => :post
    end
	end
end
