class AdminController < ApplicationController
	before_filter :ensure_admin!
	
	def index
	end
	
	def viewapps
	end
	
	def viewessays
		@essay = Studentapplication.find(params[:id]).essay
	end
	
	private
		def ensure_admin!
			unless user_signed_in? && current_user.member_type == 'admin'
				sign_out current_user
				redirect_to root_path
			end
		end
end
