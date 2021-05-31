class NotesController < ApplicationController
  before_action :find_note, only: [:update, :destroy]

  def create
    @note = @commentable.notes.new(note_params)
    @note.user = helpers.current_user
    @note.save
    redirect_to @commentable
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_note
    @note = Note.find_by(id: params[:id])
  end

  def note_params
    params.require(:note).permit(:content)
  end

end
