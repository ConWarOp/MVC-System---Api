class PostsController < ApplicationController
before_action :redirect_if_not_signed_in, only: [:new]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      redirect_to root_path
    end
  end

  def search_by_category
    if params[:search].present?
      @searchposts = Post.searchbycategory(params[:search])
    end
  end

 def post_params
   params.require(:post).permit(:content, :title, :category)
                        .merge(user_id: current_user.id)
 end

end
