class Campaigns::NotesController < NotesController
    before_action :set_commentable

    private

    def set_commentable
        @commentable = Campaign.find_by(id: params[:campaign_id])
    end

end