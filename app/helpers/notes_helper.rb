module NotesHelper

    def display_note_form_if_campaign_includes_current_user(commentable, path)
        if current_user && current_user.campaigns.include?(@campaign)
            render partial: 'notes/form', locals: { commentable: commentable, path: path }
        end
    end
    
    def display_edit_link_if_note_belongs_to_current_user(note)
        if note.user == current_user
            link_to "Edit", edit_note_path(note)
        end
    end

end
