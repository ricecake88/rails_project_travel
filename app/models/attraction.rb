class Attraction < ApplicationRecord
    belongs_to :place
    validates :name, presence: {message: 'Name cannot be blank.'}
    validates_uniqueness_of :name, scope: [:place_id], :message => 'Already entered.'

    def self.locations_in_place(leg)
        Attraction.where(:place_id => Place.find_by(:city_name => leg.arrival_city_name).id)
    end
end
