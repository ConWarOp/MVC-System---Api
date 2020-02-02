class PagesController < ApplicationController
	def home

	end
	def addfriend
		if params[:search].present?
      @userbyemail = User.find_by_email(params[:search])
			#helpers.link_to friendships_path(:friend_id => @userbyemail.id), :method => :post
    end
	end

	def search
    @searchusers = User.search(params[:search])
    respond_to do |format|
     format.js  { render :partial => "search", :locals => {:search => @searchusers, :query => params[:search]} }
     format.html    { render :home }
    end
end
end
