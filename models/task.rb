class Task < ApplicationRecord
    validate :title_presence
    validate :start_end_check
    
    private
    def title_presence
        errors.add(:title, " is needed.") unless
        self.title != ""
    end
    def start_end_check
        errors.add(:enddate, " must be after Start date.") unless
        self.startdate <= self.enddate
    end
end
