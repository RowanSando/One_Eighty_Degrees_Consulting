class AdminController < ApplicationController
	# before_filter :ensure_admin!
	
	def index
	end
	
	def viewapps
	end
	
	private
		def ensure_admin!
			unless current_user.member_type == 'admin'
				sign_out current_user
				redirect_to root_path
			end
		end
end
