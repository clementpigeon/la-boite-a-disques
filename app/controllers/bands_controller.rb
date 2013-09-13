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

    if @band.save
      redirect_to @band
    else
      false
    end

  end


  def update
    @band = Band.find(params[:id])

    # respond_to do |format|
    #   if @band.update_attributes(params[:band])
    #     format.html { redirect_to @band, notice: 'Band was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: "edit" }
    #     format.json { render json: @band.errors, status: :unprocessable_entity }
    #   end
    # end

    redirect_to @band
  end


  def destroy
    @band = Band.find(params[:id])
    # @band.destroy


  end
end
