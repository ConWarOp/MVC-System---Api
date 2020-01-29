class CallbacksController < ApplicationController
  def facebook
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect_to root_url @user
  end
end
