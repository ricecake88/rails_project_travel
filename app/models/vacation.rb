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
end
