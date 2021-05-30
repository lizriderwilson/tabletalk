class Seshion < ApplicationRecord
    belongs_to :campaign

    def self.oldest_to_newest
        self.order(:start_time)
    end

    def self.newest_to_oldest
        self.order(start_time: :desc)
    end
end
