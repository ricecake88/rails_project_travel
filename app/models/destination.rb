class Destination < ApplicationRecord
    has_many :legs
    has_many :vacations, through: :legs
    has_many :attractions
    validates :city_name, presence: { message: 'cannot be blank.' }
    validates :country_name, presence: { message: 'cannot be blank.' }
    validates_uniqueness_of :city_name, scope: [:state_name, :country_name], message: 'already entered.'
    validates_format_of :city_name, :country_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/

    def self.user_destinations(user)

        user_destinations = []
        user.vacations.each do |vacation|
            vacation.destinations.uniq.each do |dest|
                if !user_destinations.include?(dest)
                    user_destinations << Destination.find_by(:id => dest.id)
                end
            end
        end
        return user_destinations
    end

    def self.find_destination(city)
        Destination.where(city_name: city)
    end

end
