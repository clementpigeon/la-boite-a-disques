class AlbumsController < ApplicationController

  def index
    @albums = Album.all

  end


  def show
    @album = Album.includes(:tracks).find(params[:id])
    @band = @album.band

    render :show
  end


  def new
    @album = Album.new
    @album.band_id = params[:band_id]
    @bands = Band.all

    render :new
  end


  def edit
    @album = Album.find(params[:id])
    @bands = Band.all

    render :edit

  end


  def create
    @album = Album.new(params[:album])

    if @album.save
      redirect_to album_url(@album)
    else
      render :new
    end

  end


  def update
    @album = Album.find(params[:id])

    @album.update_attributes(params[:album])
    if @album.save
      redirect_to album_url(@album)
    else
      render :edit
    end

  end


  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to band_url(@album.band)

  end
end
