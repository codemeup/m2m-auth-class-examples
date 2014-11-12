class CoursesController < ApplicationController

  def index
    @all = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = "You have successfully created a new course"
      redirect_to @course
    else
      redirect_to Course
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def show
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_params)
    flash[:notice] = "You have successfully updated a course"
    redirect_to Course
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:notice] = "You have successfully deleted a course"
    redirect_to Course
  end

  private
  def course_params
    params.require(:course).permit(:name)
  end
end
