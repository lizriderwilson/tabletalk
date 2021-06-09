module CampaignsHelper

    def display_edit_join_or_leave_campaign
        if @campaign.gm == current_user
            link_to("Edit", edit_user_campaign_path(current_user, @campaign), class: "btn mr-2") + display_delete_asset_link("Delete Campaign", user_campaign_path(current_user, @campaign), "btn", "Are you sure?")
        elsif current_user && !current_user.campaigns.include?(@campaign)
            link_to "Join", new_campaign_character_path(@campaign), class: "btn"
        elsif current_user && current_user.campaigns.include?(@campaign)
            display_delete_asset_link("Leave Campaign", campaign_character_path(@campaign, character(current_user)), "btn", "Are you sure? Your character will be deleted!")
        end
    end

    def display_number_of_players(campaign)
        campaign.players.count == 1 ? "#{campaign.players.count} player" : "#{campaign.players.count} players"
    end
    
end

