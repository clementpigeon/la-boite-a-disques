class TracksController < ApplicationController

  def index
    @tracks = Track.all

    render :index
  end


  def show
    @track = Track.find(params[:id])

    render :show
  end


  def new
    @track = Track.new
    @albums = Album.all
    @album = Album.find(params[:album_id])
    render :new
  end


  def edit
    @track = Track.find(params[:id])
    @albums = Album.all

  end


  def create
    @track = Track.new(params[:track])


  end


  def update
    @track = Track.find(params[:id])


  end


  def destroy
    @track = Track.find(params[:id])
    @track.destroy


  end
end
