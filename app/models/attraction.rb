class Attraction < ApplicationRecord
    belongs_to :place
    validates :name, presence: {message: 'Name cannot be blank.'}
    validates_uniqueness_of :name, scope: [:place_id], :message => 'Already entered.'
end
