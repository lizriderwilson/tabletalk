class Seshions::NotesController < NotesController
    before_action :set_commentable

    def create
        @note = @commentable.notes.new(note_params)
        @note.user = helpers.current_user
        @note.save
        redirect_to campaign_seshion_path(@commentable.campaign, @commentable)
    end

    private

    def set_commentable
        @commentable = Seshion.find_by(id: params[:seshion_id])
    end

end