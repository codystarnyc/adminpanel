class CoursesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    # @roster = @course.course_registrations
    @instructors = Instructor.all
    @course_registration = CourseRegistration.new
    @students = Student.joins('LEFT OUTER JOIN course_registrations ON course_registrations.student_id = students.id').where.not(id: CourseRegistration.where(course_id: @course.id).pluck(:student_id)).distinct
end

  # GET /courses/new
  def new
    @course = Course.new
    @instructors = Instructor.all
  end

  # GET /courses/1/edit
  def edit
    @instructors = Instructor.all
    @course = Course.all
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :total_hours, :instructor_id, :created_at, :updated_at)
    end
end
