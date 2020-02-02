class PagesController < ApplicationController
	def home
          @posts = Post.limit(5)
        end
	def addfriend
		if params[:search].present?
      @userbyemail = User.search(params[:search])
    end
	end
end
