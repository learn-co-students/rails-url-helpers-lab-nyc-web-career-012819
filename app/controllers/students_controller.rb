class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    @is_active = nil
    if @student.active == false
      @is_active = "inactive"
    elsif @student.active == true
      @is_active = "active"
    end
    @is_active
  end

  def activate
    @student = Student.find(params[:id])
    if @student.active == false
      @student.active = true
    else
      @student.active = false
    end
    @student.save
    redirect_to :student
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
