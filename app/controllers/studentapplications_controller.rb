class StudentapplicationsController < ApplicationController
  before_filter :ensure_loggedin!
  
  def studentapplication_params
    params.require(:studentapplication).permit(:major, :graduation, :info, :user_id, :status)
  end
  
  def new
    @studentapplication = Studentapplication.new
  end
  
  def create
    @studentapplication = Studentapplication.new(studentapplication_params)
    @studentapplication.status = "Pending"
    @studentapplication.save
  end
  
  private
		def ensure_loggedin!
			unless user_signed_in?
				redirect_to new_user_session_path
			end
		end
end
