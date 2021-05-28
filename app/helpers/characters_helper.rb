module CharactersHelper

    def character(player)
        player.characters.select do |c|
            c.campaign_id == @campaign.id
        end.first
    end

end
