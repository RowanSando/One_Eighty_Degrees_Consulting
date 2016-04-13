class UsersController < ApplicationController
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
        redirect_to "/admin/editusers"
    end
  end
  
  def upgrade
      @user = User.find(params[:id])
      @user.member_type = "admin"
      
      redirect_to "/admin/editusers"
  end
end
