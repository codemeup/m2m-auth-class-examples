class StudentsController < ApplicationController

  def index
    @all = Student.all
  end

  def allcourses
    @student = Student.find(params[:id])
    @courses = @student.courses
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "You have successfully created a new student"
      redirect_to @student
    else
      redirect_to Student
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def enroll
    @student = Student.find(params[:id])
  end

  # Don't do this yet....
  def create_enrollment
    @student = Student.find(params[:id])
    existing_course_ids = @student.enrollments.pluck(:course_id)

    @course = Course.find(params[:id])
    @student.update(student_params)
    flash[:notice] = "You have successfully enrolled a student"
    redirect_to Student
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    flash[:notice] = "You have successfully updated a student"
    redirect_to Student
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:notice] = "You have successfully deleted a student"
    redirect_to Student
  end

  private
  def student_params
    params.require(:student).permit(:name)
  end
end
