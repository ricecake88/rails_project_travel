class Place < ApplicationRecord
    has_many :vacation_places
    has_many :vacations, through: :vacation_places
    has_many :attractions
    validates :city_name, presence: { message: 'City cannot be blank.' }
    validates :country_name, presence: { message: 'Country cannot be blank.' }
    validates_uniqueness_of :city_name, scope: [:state_name, :country_name]
    #todo: check no strange characters

    def self.user_places(user)
        #@vacations = VacationPlace.where(vacation_id: user.vacations)

        user_places = []
        user.vacations.each do |vacation|
            vacation.places.uniq.each do |place|
                if !user_places.include?(place)
                    user_places << Place.find_by(:id => place.id)
                end
            end
        end
        return user_places
    end
end
