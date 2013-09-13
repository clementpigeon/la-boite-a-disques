class AlbumsController < ApplicationController

  def index
    @albums = Album.all

  end


  def show
    @album = Album.includes(:tracks).find(params[:id])
    # @album = Album.includes(:band, :tracks).find(params[:id])
    @band = @album.band
    # @tracks = @album.tracks

    # with a nested include you could do that:
    #@band.albums.each do |album| album.tracks.each do |track| ... end end
    render :show
  end


  def new
    @album = Album.new
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

    # respond_to do |format|
    #   if @album.save
    #     format.html { redirect_to @album, notice: 'Album was successfully created.' }
    #     format.json { render json: @album, status: :created, location: @album }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @album.errors, status: :unprocessable_entity }
    #   end
    # end
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
    # @album.destroy


  end
end
