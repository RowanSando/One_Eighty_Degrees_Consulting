class StudentapplicationsController < ApplicationController
  before_filter :ensure_loggedin!
  
  def studentapplication_params
    params.require(:studentapplication).permit(:name, :major, :graduation, :info, :user_id, :status)
  end
  
  def show
    @studentapplication = Studentapplication.find(params[:id])
  end

  def edit
    @studentapplication = Studentapplication.find(params[:id])
  end
  
  def update
    @studentapplication = Studentapplication.find params[:id]
    @studentapplication.update_attributes!(studentapplication_params)
    flash[:notice] = "Your application was successfully updated."
    redirect_to studentapplication_path(@studentapplication)
  end
  
  def new
    current_application = current_user.studentapplication
    if current_application.nil?
      @studentapplication = Studentapplication.new
    else
      redirect_to studentapplication_path(current_application)
    end
  end
  
  def create
    @studentapplication = Studentapplication.new(studentapplication_params)
    @studentapplication.status = "Pending"
    @studentapplication.user_id = current_user.id
    current_user.studentapplication = @studentapplication
    @studentapplication.save
  end
  
  private
		def ensure_loggedin!
			unless user_signed_in?
				redirect_to new_user_session_path
			end
		end
end
