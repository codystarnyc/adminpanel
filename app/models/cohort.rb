class Cohort < ApplicationRecord
    belongs_to :instructor
    has_many :students, dependent: :destroy

  
    # validates_presence_of   :name
    # validates_presence_of   :start_date
    # validates_presence_of   :end_date
end
