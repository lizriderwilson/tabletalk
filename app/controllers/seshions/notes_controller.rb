class Seshions::NotesController < NotesController
    before_action :set_commentable

    private

    def set_commentable
        @commentable = Seshion.find_by(id: params[:seshion_id])
    end

end