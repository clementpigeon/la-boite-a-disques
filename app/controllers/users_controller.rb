class UsersController < ApplicationController

  def new
    render :new
  end


  def create
    puts 'create 1'
    @user = User.create!(params[:user])
    puts 'create 2'
    login_user!(@user)
    puts 'create 3'
    redirect_to bands_url

  end


  def activate

  end



end