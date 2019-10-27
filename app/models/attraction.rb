class Attraction < ApplicationRecord
    belongs_to :place
    validates :name, presence: {message: 'cannot be blank.'}
    validates_uniqueness_of :name, scope: [:place_id], :message => 'Already entered.'

    def self.locations_in_place(leg)
        @attractions = Attraction.where(:place_id => Place.find_by(:id => leg.arrival_place_id).id)
    end

    def self.under_20(place_id)
        Attraction.where("admission < 20 and place_id = ?", place_id)
    end
end
