class Student < ApplicationRecord
    def full_name
        self.first_name + " " + self.last_name
        end
        
        belongs_to :cohort
        has_many :course_registrations, dependent: :destroy
        has_many :courses, :through => :course_registrations
        validates :age, :inclusion => {:in => 1..149, :message => "should be between 1 and 149"}
        # encrypted_password
        validates_presence_of   :first_name
        validates_presence_of   :last_name
      
      

end
