class SponsorsController < ApplicationController
  
  def user_params
    params.require(:sponsor).permit(:name, :email, :info)
  end
  
  def new
    @sponsor = Sponsor.new
  end
  

  def create
    @sponsor = Sponsor.new(user_params)
    @sponsor.save
  end
  
end
