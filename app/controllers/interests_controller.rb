class InterestsController < ApplicationController
before_action :redirect_if_not_signed_in
  def create
    interest= Interest.new(post_id: params[:post],user_id: params[:userid])
    p interest
    if interest.save
      flash[:notice] = "Interest added."
    else
      @error=interest.errors.full_messages.to_s
      @error = @error[2...-2]
      flash[:alert] = @error#}"Friend not added"
    end
    redirect_to root_path
  end
end
