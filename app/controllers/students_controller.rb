class StudentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
   
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])
    @student.cohorts << Cohort.find(params[:q][:q]) if params[:q]
    @student.cohorts.delete(Cohort.find(params[:removecohort])) if params[:removecohort]
  end
 
  # GET /students/new
  def new
    @student = Student.new
    @cohorts = Cohort.all
    respond_to do |format|
      format.html
      format.js
      end
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.js
    end
  end

  # def new_release
  #   @student = Student.find(params[:id])
  #   @student = Student.new
  #   respond_to do |format|
  #     format.html
  #     format.js
  #   end
  # end 


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :age, :education, :cohort_id, :created_at, :updated_at, :cohort_id)
    end
end
