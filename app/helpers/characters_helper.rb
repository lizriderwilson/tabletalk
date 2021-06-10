module CharactersHelper

    def display_edit_btn_if_character_belongs_to_player
        if @character.player == current_user
            link_to "Edit Character", edit_campaign_character_path(@campaign, @character), class: "btn"
        end
    end

end
