class ItineraryItem < ApplicationRecord
    belongs_to :leg
    belongs_to :vacation
end
