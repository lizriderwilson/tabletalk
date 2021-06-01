class Campaigns::NotesController < NotesController
    before_action :set_commentable

    def create
        @note = @commentable.notes.new(note_params)
        @note.user = helpers.current_user
        @note.save
        redirect_to campaign_path(@commentable)
    end

    private

    def set_commentable
        @commentable = Campaign.find_by(id: params[:campaign_id])
    end

end