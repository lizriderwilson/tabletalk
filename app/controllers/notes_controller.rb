class NotesController < ApplicationController
  before_action :find_note, only: [:edit, :update, :destroy]

  def edit
  end

  def update
    @note.update(note_params)
    if @note.commentable_type == "Campaign"
      redirect_to campaign_path(@note.commentable)
    elsif @note.commentable_type == "Seshion"
      redirect_to campaign_seshion_path(@note.commentable.campaign, @note.commentable)
    end
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
