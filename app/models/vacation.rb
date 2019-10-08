class Vacation < ApplicationRecord
    belongs_to :user
    has_many :legs
    has_many :vacation_places
    has_many :places, through: :vacation_places
    validates_with DateValidator
    validates :name, presence: { message: "Name cannot be blank." }

    def self.permit_view(user, object)
        Vacation.where("user_id = ? and id = ?", user.id, object.vacation.id)
    end
end
