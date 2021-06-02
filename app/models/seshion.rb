class Seshion < ApplicationRecord
    belongs_to :campaign
    has_many :notes, as: :commentable, dependent: :destroy

    def self.oldest_to_newest
        self.order(:start_time)
    end

    def self.newest_to_oldest
        self.order(start_time: :desc)
    end
end
