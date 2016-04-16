class StudentapplicationsController < ApplicationController
  before_filter :ensure_loggedin!
  
  def studentapplication_params
    params.require(:studentapplication).permit(:major, :graduation, :info, :essay, :file, :user_id, :status)
  end
  
  def user_params
    params.require(:studentapplication).permit(:user => [:name, :email])
  end
  
  def show
    @studentapplication = Studentapplication.find(params[:id])
    status = @studentapplication.status
    if status == "Pending"
      @status = "Your application has been received. We are presently in the process of reviewing."
    elsif status == "Accepted"
      @status = "Congratulations! You are accepted."
    else
      @status = "Sorry."
    end
  end

  def edit
    @studentapplication = Studentapplication.find(params[:id])
    if DateTime.now > DateTime.new(2016, 5, 9, 23, 59, 59)
      flash[:notice] = "Sorry. The application cannot be edited after the deadline."
      redirect_to studentapplication_path(@studentapplication)
    end
  end
  
  def update
    @studentapplication = Studentapplication.find params[:id]
    @studentapplication.update_attributes!(studentapplication_params)
    @studentapplication.user.update_attributes!(user_params[:user])
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
    if @studentapplication.valid?
      @studentapplication.status = "Pending"
      @studentapplication.user_id = current_user.id
      current_user.studentapplication = @studentapplication
      @studentapplication.save
    else
      flash[:notice] = "You are missing required fields."
      redirect_to '/studentapplications/new'
    end
  end
  
  def change_status
    if params.has_key?("accept")
      value = "Accepted"
    else params.has_key?("reject")
      value = "Rejected"
    end
    if params.has_key?("select_user")
      params["select_user"].each do |id|
        application = Studentapplication.find(id)
        application.status = value
        application.message = params["text"]
        application.save
        UserNotifier.notify_user(application.user).deliver_now
        flash[:notice] = "User has been notified of their updated application status by email."
      end
    end
    redirect_to admin_viewapps_path
  end
  
  private
		def ensure_loggedin!
			unless user_signed_in?
				redirect_to new_user_session_path
			end
		end
end
