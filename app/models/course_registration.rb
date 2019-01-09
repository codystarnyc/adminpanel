class CourseRegistration < ApplicationRecord
    belongs_to :instructor, required: false
    belongs_to :cohort, required: false
    belongs_to :student, required: false
end