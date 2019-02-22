class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    set_student
  end

  def activate_student
    @student = Student.find(params[:id])
    # or @student = set_student?
    # @student.active ? @student.active = false : @student.active = true
    if @student.active
      @student.active = false
      @student.save
    else
      @student.active = true
      @student.save
    end
    # redirect_to action: "show", id: @student.id
    redirect_to student_path(@student), :id => @student.id
    # both redirect work.
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
