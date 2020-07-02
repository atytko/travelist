class NotesController < ApplicationController
  def index
    @note = Note.new
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    require 'net/http'
    require 'json'

    @note = Note.new(note_params)
    temperature = TemperaturesController.new 
    @note.weather = temperature.get_temperature(@note.city)
    if @note.save
      flash[:success] = 'Note created'
    else
      flash[:error_label] = 'ERROR: Note was not created'
      flash[:error] = @note.errors.any?
      flash[:errors_list] = @note.errors.messages
    end

    redirect_to notes_path
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to notes_path
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:city, :message, :created_at)
  end
end
