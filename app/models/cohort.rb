class Cohort < ApplicationRecord
    belongs_to :instructor
    has_many :courses
    has_many :students, dependent: :destroy
    has_many :course_registrations, dependent: :destroy
end
