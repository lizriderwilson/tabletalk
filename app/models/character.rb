class Character < ApplicationRecord
    belongs_to :player, class_name: 'User'
    belongs_to :campaign

    validate :one_character_per_player_per_campaign

    def one_character_per_player_per_campaign
        errors.add(:player_id, "already joined this campaign") unless campaign.player_ids == campaign.player_ids.uniq
    end
    
end
