class DateValidator < ActiveModel::Validator

    def validate(record)
        if record.end_date?
            if record.end_date < record.start_date
                record.errors.add(:end_date, "End date cannot be before start date.")
            end
        end
    end
end