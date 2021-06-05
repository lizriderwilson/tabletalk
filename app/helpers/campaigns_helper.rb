module CampaignsHelper

    def edit_or_join_campaign
        if @campaign.gm == current_user
            link_to("Edit", edit_user_campaign_path(current_user, @campaign), class: "btn") + delete_asset("Delete Campaign", user_campaign_path(current_user, @campaign), "Are you sure?")
        elsif current_user && !current_user.campaigns.include?(@campaign)
            link_to "Join", new_campaign_character_path(@campaign), class: "btn"
        elsif current_user && current_user.campaigns.include?(@campaign)
            delete_asset("Leave Campaign", campaign_character_path(@campaign, character(current_user)), "Are you sure? Your character will be deleted!")
        end
    end

    def display_number_of_players(campaign)
        campaign.players.count == 1 ? "#{campaign.players.count} player" : "#{campaign.players.count} players"
    end
    
end

