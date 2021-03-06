class BandsController < ApplicationController

  def index
    @bands = Band.all

    render :index
  end


  def show
    @band = Band.includes(:albums => :tracks).find(params[:id])
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
    if @band.save
      redirect_to band_url(@band)
    else
      render :new
    end

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
    @band.destroy

    redirect_to :bands

  end
end
