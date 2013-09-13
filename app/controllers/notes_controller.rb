class NotesController < ApplicationController

  def index
    @notes = Note.all

    render :index
  end


  def show
    @note = Note.find(params[:id])

    render :show
  end


  def new
    @note = Note.new
    @note.user_id = 1
    @note.track_id = params[:track_id]
    render :new
  end


  def edit
    @note = Note.find(params[:id])
  end


  def create
    @note = Note.new(params[:note])
    if @note.save
      redirect_to track_url(@note.track_id)
    else
      render :new
    end

  end


  def update
    @note = Note.find(params[:id])
    @note.update_attributes(params[:note])
    if @note.save
      redirect_to track_url(@note.track.id)
    else
      render :edit
    end

  end


  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to track_url(@note.track)

  end
end
