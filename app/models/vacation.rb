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
end
