class CourseRegistrationsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_course_registration, only: [:show, :edit, :update, :destroy]

  # GET /course_registrations
  # GET /course_registrations.json
  def index
    @course_registrations = CourseRegistration.all
  end

  # GET /course_registrations/1
  # GET /course_registrations/1.json
  def show
  end

  # GET /course_registrations/new
  def new
    @course_registration = CourseRegistration.new
  end

  # GET /course_registrations/1/edit
  def edit
  end

  # POST /course_registrations
  # POST /course_registrations.json
  def create
    @course_registration = CourseRegistration.new(course_registration_params)
    @student = Student.find(@course_registration[:student_id])
    respond_to do |format|
      if @course_registration.save
        format.html { flash[:notice] = "#{@student.full_name} was added to course" }
        format.json { render :show, status: :created, location: @course_registration }
      else
        format.html { render :new }
        format.json { render json: @course_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_registrations/1
  # PATCH/PUT /course_registrations/1.json
  def update
    respond_to do |format|
      if @course_registration.update(course_registration_params)
        format.html { redirect_to @course_registration, notice: 'Course registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_registration }
      else
        format.html { render :edit }
        format.json { render json: @course_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_registrations/1
  # DELETE /course_registrations/1.json
  def destroy
    @course_registration.destroy
    @student = Student.find(@course_registration[:student_id])
    respond_to do |format|
      format.html {  flash[:notice] = "'#{@student.full_name}' was removed" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_registration
      @course_registration = CourseRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_registration_params
      params.require(:course_registration).permit(:course_id, :student_id, :created_at, :updated_at, :course_id, :course_id, :student_id)
    end
end
