class BandsController < ApplicationController

  def index
    @bands = Band.all

    render :index
  end


  def show
    @band = Band.find(params[:id])
    @albums = @band.albums
    render :show
  end


  def new
    @band = Band.new

    render:new
  end


  def edit
    @band = Band.find(params[:id])

  end


  def create
    @band = Band.new(params[:band])

    @band.save!

    redirect_to band_url(@band)

  end


  def update
    @band = Band.find(params[:id])
    @band.update_attributes(params[:band])
    if @band.save
      redirect_to band_url(@band)
    else
      render :edit
    end
  end


  def destroy
    @band = Band.find(params[:id])
    # @band.destroy


  end
end
