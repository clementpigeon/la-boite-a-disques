class BandsController < ApplicationController
  # GET /bands
  # GET /bands.json
  def index
    @bands = Band.all

    render :index
  end

  # GET /bands/1
  # GET /bands/1.json
  def show
    @band = Band.find(params[:id])

    render :show
  end

  # GET /bands/new
  # GET /bands/new.json
  def new
    @band = Band.new

    render:new
  end

  # GET /bands/1/edit
  def edit
    @band = Band.find(params[:id])

    #redirect_to
  end

  # POST /bands
  # POST /bands.json
  def create
    @band = Band.new(params[:band])

    if @band.save
      true
    else
      false
    end

  end

  # PUT /bands/1
  # PUT /bands/1.json
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
  end

  # DELETE /bands/1
  # DELETE /bands/1.json
  def destroy
    @band = Band.find(params[:id])
    # @band.destroy


  end
end
