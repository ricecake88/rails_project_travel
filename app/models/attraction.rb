class Attraction < ApplicationRecord
    belongs_to :destination
    validates :name, presence: {message: 'cannot be blank.'}
    validates_uniqueness_of :name, scope: [:destination_id], :message => 'Already entered.'

    def self.locations_in_destination(leg)
        @attractions = Attraction.where(:destination_id => Destination.find_by(:id => leg.destination_id).id)
    end

    def self.under_20(destination_id)
        Attraction.where("admission < 20 and destination_id = ?", destination_id)
    end
end
