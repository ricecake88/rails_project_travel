class Vacation < ApplicationRecord
    belongs_to :user
    has_many :legs
    has_many :vacation_places
    has_many :places, through: :vacation_places
    validates_with DateValidator
    validates :name, presence: { message: "Name cannot be blank." }

    def self.permit_view(user, object)
        if object.present?
            @vacation = Vacation.where("user_id = ? and id = ?", user.id, object.vacation.id)
        else
            nil
        end
    end

    def self.permit_view_by_leg_id(user, leg_id)
        leg = Leg.find_by(:id => leg_id)
        if leg.present?
            @vacation = Vacation.where("user_id = ? and id = ?", user.id, leg.vacation.id)
        else
            nil
        end
    end

    def self.update_vacation_places(leg, action)
        arrival_place = Place.find_by(:id => leg.arrival_place_id)
        departure_place = Place.find_by(:id => leg.departure_place_id)
        if arrival_place.present? && departure_place.present?
            if action == "create"
                leg.vacation.places << arrival_place
                leg.vacation.places << departure_place
            else action == "delete"
                @arrival_vacation_place = VacationPlace.find_by(:vacation_id => leg.vacation.id, :place_id => arrival_place.id)
                @departure_vacation_place = VacationPlace.find_by(:vacation_id => leg.vacation.id, :place_id => departure_place.id)
                VacationPlace.delete(@arrival_vacation_place)
                VacationPlace.delete(@departure_vacation_place)
            end
        end
    end
end
