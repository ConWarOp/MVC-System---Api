class PagesController < ApplicationController
	def home
		if params[:search].present?
			@posts = Post.searchbycategory(params[:search])
		else
          @posts = Post.limit(5)
        end
			end
	def addfriend
		if params[:search].present?
      @userbyemail = User.search(params[:search])
    end
	end
end
