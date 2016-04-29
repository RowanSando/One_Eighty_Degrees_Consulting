class AdminController < ApplicationController
	before_filter :ensure_admin!
	
	def index
	end
	
	def viewapps
	end
	
	def viewessays
		app = Studentapplication.find(params[:id])
		@essay = app.essay
		@name = app.user.name
	end
	
	def new_deadline
		@date = Deadline.last
	end
	
	def set_deadline
		if not Deadline.last.nil?
			Deadline.last.destroy
		end
		deadline = Deadline.new(date_params)
		deadline.save!
		flash[:notice] = "Deadline #{deadline.date.strftime("%m/%d/%Y-%I:%M%p")} was successfully set."
		redirect_to admin_path
	end
	
	private
		def ensure_admin!
			unless user_signed_in? && current_user.member_type == 'admin'
				sign_out current_user
				redirect_to root_path
			end
		end
		
		def date_params
    	params.require(:date).permit(:date)
  	end
end
