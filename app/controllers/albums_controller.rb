class AlbumsController < ApplicationController


  def index
    @albums = Album.all


  end


  def show
    @album = Album.find(params[:id])
    @band = @album.band
    render :show
  end


  def new
    @album = Album.new

    render :new
  end


  def edit
    @album = Album.find(params[:id])


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

    # respond_to do |format|
    #   if @album.update_attributes(params[:album])
    #     format.html { redirect_to @album, notice: 'Album was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: "edit" }
    #     format.json { render json: @album.errors, status: :unprocessable_entity }
    #   end
    # end
  end


  def destroy
    @album = Album.find(params[:id])
    # @album.destroy


  end
end
