class Vacation < ApplicationRecord
    belongs_to :user
    has_many :legs
    has_many :destinations, through: :legs
    validates_with DateValidator
    validates :name, presence: { message: "cannot be blank." }

    def self.permit_view(user, object)
        if object.present? && user.present?
            @vacation = Vacation.where("user_id = ? and id = ?", user.id, object.vacation.id)
        else
            nil
        end
    end

    def self.update_vacation_destinations(leg, action)
        destination_place = Destination.find_by(:id => leg.destination_id)
        if destination_place.present?
            if action == "create"
                leg.vacation.destinations << destination_place
            else action == "delete"
                @leg_destination = Leg.find_by(:vacation_id => leg.vacation.id, :destination_id => destination_place.id)
               Leg.delete(@leg_destination)
            end
        end
    end
end
