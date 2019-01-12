class Instructor < ApplicationRecord
    # belongs_to :users
    has_many :cohorts
    has_many :course_registrations, dependent: :destroy
    # has_secure_password
    validates :age, :inclusion => {:in => 1..149, :message => "should be between 1 and 149"}
    validates_presence_of   :first_name
    validates_presence_of   :last_name
    validates :salary, :inclusion => {:in => 1..1000000, :message => "should be between 1 and 1,000,000"}

    def full_name
    self.first_name + " " + self.last_name
    end


end
