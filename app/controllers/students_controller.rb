class StudentsController < ApplicationController
  before_filter :ensure_loggedin!
  
  def student_params
    params.require(:student).permit(:name, :email, :major, :graduation, :info)
  end
  
  def new
    @student = Student.new
  end
  
  def create
    @student = Student.new(student_params)
    @student.save
  end
  
  private
		def ensure_loggedin!
			unless user_signed_in?
				redirect_to new_user_session_path
			end
		end
end
