class Campaign < ApplicationRecord
    belongs_to :gm, class_name: 'User'
    has_many :characters
    has_many :players, through: :characters, class_name: 'User'
    has_many :seshions
    has_many :notes, as: :commentable

    #Class methods
    def self.public
        where(is_public: true)
    end

    #Instance methods
    def visibility
        self.is_public ? "Public" : "Private"
    end

    def past_seshions
        self.seshions.where('start_time < ?', Time.current)
    end

    def upcoming_seshions
        self.seshions.where('start_time >= ?', Time.current)
    end

end
