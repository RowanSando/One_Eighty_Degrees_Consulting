class UsersController < ApplicationController
  before_filter :ensure_loggedin!
  
  def show
    @user = User.find(params[:id])
  end
  
  def update_or_destroy
    # Currently if you check yourself and click
    # delete, you'll delete yourself and be
    # redirected to the home page.
    
    # delete users
    if params.has_key?("delete")
      if params.has_key?("select_user")
        params["select_user"].each do |id|
          delete_user = User.find(id)
          delete_app = Studentapplication.find_by("user_id":id)
          unless delete_app.nil?
            delete_app.destroy
          end
          delete_user.destroy
        end
      end
    end
    
    # give admin
    if params.has_key?("giveadmin")
      admin = "admin"
      if params.has_key?("select_user")
        params["select_user"].each do |id|
          upgrade_user = User.find(id)
          upgrade_user.member_type = admin
          upgrade_user.save
        end
      end
    end
    
    # remove admin
    if params.has_key?("removeadmin")
      mem = ""
      if params.has_key?("select_user")
        params["select_user"].each do |id|
          dg_user = User.find(id)
          dg_user.member_type = mem
          dg_user.save
        end
      end
    end
    
    redirect_to admin_editusers_path
    
  end
  
  private
		def ensure_loggedin!
			unless user_signed_in?
				redirect_to new_user_session_path
			end
		end
end
