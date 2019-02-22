class StudentsController < ApplicationController
  # before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    if @student.active == true
      @active_status = "active"
    else
      @active_status = "inactive"
    end
  end

  def activate
    @student = Student.find(params[:id])
    @student.active == false ? @student.active = true : @student.active = false
    @student.save
    redirect_to student_path(@student)
  end

  # private
  #
  #   def set_student
  #     @student = Student.find(params[:id])
  #   end
end
