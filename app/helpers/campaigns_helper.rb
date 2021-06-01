module CampaignsHelper

    def edit_or_join_campaign
        if @campaign.gm == current_user
            link_to "Edit", edit_user_campaign_path(@campaign), class: "btn"
        elsif current_user && !current_user.campaigns.include?(@campaign)
            link_to "Join", new_campaign_character_path(@campaign), class: "btn"
        end
    end
    
end
