class Vacation < ApplicationRecord
    belongs_to :user
    has_many :legs
    has_many :vacation_places
    has_many :places, through: :vacation_places
end
