class Character < ApplicationRecord
    belongs_to :player, class_name: 'User'
    belongs_to :campaign
    
end
