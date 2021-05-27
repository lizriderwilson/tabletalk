class Campaign < ApplicationRecord
    belongs_to :gm, class_name: 'User'
    has_many :characters
    has_many :players, through: :characters, class_name: 'User'

    def visibility
        self.is_public ? "Public" : "Private"
    end
end
