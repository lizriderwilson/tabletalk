class NotesController < ApplicationController
  before_action :find_note, only: [:edit, :update, :destroy]
  before_action :find_commentable, only: [:update, :destroy]

  def edit
    if !@note
      redirect_to campaigns_path, alert: "Note not found"
    else
      find_commentable
      if @note.user != helpers.current_user || !helpers.current_user
        redirect_based_on_commentable_type
      end
    end
  end

  def update
    @note.update(note_params)
    redirect_based_on_commentable_type
  end

  def destroy
    @note.destroy
    redirect_based_on_commentable_type
  end

  private

  def find_note
    @note = Note.find_by(id: params[:id])
  end

  def find_commentable
    @commentable = @note.commentable
  end

  def note_params
    params.require(:note).permit(:content)
  end

  def redirect_based_on_commentable_type
    if @note.commentable_type == "Campaign"
      redirect_to campaign_path(@commentable)
    elsif @note.commentable_type == "Seshion"
      redirect_to campaign_seshion_path(@commentable.campaign, @commentable)
    end
  end

end
