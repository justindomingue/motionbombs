class OauthsController < ApplicationController
  
  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      redirect_to root_path, :notice => "Logged in from #{provider.titleize}!"
    else
      begin
        @user = create_from(provider)
        reset_session # protect from session fixation attack
        auto_login(@user)
        flash[:success] = "Logged in from #{provider.titleize}!"
        redirect_to root_path 
      rescue
        flash[:error] = "Failed to login from #{provider.titleize}!"
        redirect_to root_path
      end
    end
  end
end
