class PagesController < ApplicationController
	def home
		if params[:search].present?
			if params[:Submit]=='Category'
			@posts = Post.searchbycategory(params[:search])
		elsif params[:Submit]=='Title'
			@posts = Post.searchbytitle(params[:search])
			end
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
