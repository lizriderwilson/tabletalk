class Campaign < ApplicationRecord
    belongs_to :gm, class_name: 'User'
end
