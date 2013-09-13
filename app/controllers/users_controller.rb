class UsersController < ApplicationController

  def new


    render :new
  end


  def create
    @user = User.create!(params[:user])
    login_user!(@user)

    redirect_to bands_url

  end


  def activate

  end



end