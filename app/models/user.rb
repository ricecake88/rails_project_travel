class User < ApplicationRecord
    has_many :vacations
    belongs_to :place
end
