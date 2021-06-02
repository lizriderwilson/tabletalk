module CharactersHelper

    def character(player)
        player.characters.select do |c|
            c.campaign_id == @campaign.id
        end.first
    end

    def edit_btn_if_character_player
        if @character.player == current_user
            link_to "Edit Character", edit_campaign_character_path(@campaign, @character), class: "btn"
        end
    end

end
