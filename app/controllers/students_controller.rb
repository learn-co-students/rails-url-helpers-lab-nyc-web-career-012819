class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    if @student.active == false
      @active = "inactive"
    else
      @active = "active"
    end
    render 'show.html.erb'
  end

  def activate
    @student = Student.find(params[:id])
    @student.toggle
    @student.save
    redirect_to :student
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
