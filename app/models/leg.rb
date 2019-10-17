class Leg < ApplicationRecord
    belongs_to :vacation
    has_many :itinerary_items

    def self.sort(vacation_id)
        Leg.where(:vacation_id => vacation_id).order(:leg_num)
    end
end
