class CourseRegistrationsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_course_registration, only: [:show, :delete, :destroy]

  def new
      @course_registration = CourseRegistration.new
  end

  def create
      @course_registration = CourseRegistration.create(course_registration_params)
      @student = Student.find(@course_registration[:student_id])
     
      if @course_registration.save
      respond_to do |format|
          format.js 
        else
          format.html { render :new }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
  end
end
  def show
  end

  def delete
  end

  def destroy
      @course_registration.destroy
      @student = Student.find(@course_registration[:student_id])
      flash[:notice] = "'#{@student.full_name}' was removed"
  end

  private
      def set_course_registration
          @course_registration = CourseRegistration.find(params[:id])
      end
      def course_registration_params
          params.require(:course_registration).permit(:instructor_id, :cohort_id, :student_id)
      end
end
