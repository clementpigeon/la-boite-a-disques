class TracksController < ApplicationController
  include TracksHelper

  def index
    @tracks = Track.all
    render :index
  end

  def show
    @track = Track.find(params[:id])
    @note = Note.new
    @note.track_id = params[:id]
    @note.user_id = 1
    render :show
  end

  def new
    @albums = Album.all
    @track = Track.new
    @track.album = Album.find(params[:album_id])
    render :new
  end

  def edit
    @track = Track.find(params[:id])
    @albums = Album.all

  end

  def create
    @track = Track.create!(params[:track])
    if @track.save
      redirect_to album_url(@track.album)
    else
      render :new
    end
  end


  def update
    @track = Track.find(params[:id])

    @track.update_attributes(params[:track])
    # @track.lyrics = ugly_lyrics(params[:track][:lyrics])
    if @track.save
      redirect_to album_url(@track.album)
    else
      render :edit
    end
  end


  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to album_url(@track.album)

  end
end
