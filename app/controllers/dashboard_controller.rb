class DashboardController < ApplicationController
  before_action :authenticate_user!

  before_action :authenticate_user!

  def index
      @new_courses = Course.all.order(id: :desc).limit(5)
      @new_cohorts = Cohort.all.order(id: :desc).limit(5)
      @new_students = Student.all.order(id: :desc).limit(5)
      @new_instructors = Instructor.all.order(id: :desc).limit(5)
    end

   
    def home
        @new_courses = Course.all.order(id: :desc).limit(5)
        @new_cohorts = Cohort.all.order(id: :desc).limit(5)
        @new_students = Student.all.order(id: :desc).limit(5)
        @new_instructors = Instructor.all.order(id: :desc).limit(5)
      end


end
