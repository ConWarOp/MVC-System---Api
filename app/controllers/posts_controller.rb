class PostsController < ApplicationController
before_action :redirect_if_not_signed_in, only: [:new]

  def show
    @post = Post.find(params[:id])
    @interestedUsers=User.joins("INNER JOIN interests ON users.user_ID = interests.user_id").where('interests.post_id=?' ,params[:id]).select("users.email")
    #@interestedUsers=User.joins(Interest.where(post_id: params[:id])
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

 def post_params
   params.require(:post).permit(:content, :title, :category)
                        .merge(user_id: current_user.id)
 end



end
