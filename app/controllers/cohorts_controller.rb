class CohortsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_cohort, only: [:show, :edit, :update, :destroy]

  # GET /cohorts
  # GET /cohorts.json
  def index
    @cohorts = Cohort.all
  end

  # GET /cohorts/1
  # GET /cohorts/1.json
  def show
        @cohort = Cohort.find(params[:id])
        # @course_registration = CourseRegistration.new
        # # @students = Student.all.sort
        # @cohort.students << Student.find(params[:q][:student_ids]) if params[:q]    
        @roster = @cohort.course_registrations
        @course_registration = CourseRegistration.new
        @students = Student.joins('LEFT OUTER JOIN course_registrations ON course_registrations.student_id = students.id').where.not(id: CourseRegistration.where(cohort_id: @cohort.id).pluck(:student_id)).distinct
       
  end

  # GET /cohorts/new
  def new
    @cohort = Cohort.new
    @instructors = Instructor.all
    @course = Course.all
  end

  # GET /cohorts/1/edit
  def edit
  #   @cohort = Cohort.new
    @instructors = Instructor.all
    @course = Course.all
  end

  # POST /cohorts
  # POST /cohorts.json
  def create
    @cohort = Cohort.new(cohort_params)
    
    respond_to do |format|
      if @cohort.save
        format.html { redirect_to @cohort, notice: 'Cohort was successfully created.' }
        format.json { render :show, status: :created, location: @cohort }
      else
        format.html { render :new }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cohorts/1
  # PATCH/PUT /cohorts/1.json
  def update
    respond_to do |format|
      if @cohort.update(cohort_params)
        format.html { redirect_to @cohort, notice: 'Cohort was successfully updated.' }
        format.json { render :show, status: :ok, location: @cohort }
      else
        format.html { render :edit }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cohorts/1
  # DELETE /cohorts/1.json
  def destroy
    @cohort.destroy
    respond_to do |format|
      format.html { redirect_to cohorts_url, notice: 'Cohort was successfully destroyed.' }
      format.js 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cohort
      @cohort = Cohort.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cohort_params
      params.require(:cohort).permit(:title, :start_date, :end_date, :instructor_id, :created_at, :updated_at, :course_id)
    end
end
