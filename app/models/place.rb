class Place < ApplicationRecord
    has_many :vacation_places    
    has_many :vacations, through: :vacation_places
    has_many :attractions
end
