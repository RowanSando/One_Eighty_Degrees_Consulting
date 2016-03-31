class StudentsController < ApplicationController
  
  def user_params
    params.require(:student).permit(:name, :email, :major, :graduation, :info)
  end
  
  def new
    @student = Student.new
  end
  

  def create
    @student = Student.new(user_params)
    @student.save
  end
  
end
