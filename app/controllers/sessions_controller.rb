class SessionsController < ApplicationController


  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user.nil?
      render :new
      return
    else
      login_user!(user)
      redirect_to bands_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil

    redirect_to bands_url
  end

  def new
    render :new
  end


end