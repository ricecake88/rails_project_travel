class Place < ApplicationRecord
    has_many :vacation_places    
    has_many :vacations, through: :vacation_places
    has_many :attractions
    validates :city_name, presence: { message: 'City cannot be blank.' }
    validates :country_name, presence: { message: 'Country cannot be blank.' }
    validates_uniqueness_of :city_name, scope: [:state_name, :country_name]
end
