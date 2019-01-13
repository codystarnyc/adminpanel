class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
      @users = User.all.order(id: :desc).limit(5)
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

      private
def set_user
      @user = User.find(params[:id])
end
end
