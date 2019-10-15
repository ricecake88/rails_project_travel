class Leg < ApplicationRecord
    belongs_to :vacation
    has_many :itinerary_items
end
