class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
  end

  def activate
    change_status(set_student)

   redirect_to student_path(@student.id)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def change_status(student)
      student.active==false ? student.active=true : student.active=false
      student.save
    end

end