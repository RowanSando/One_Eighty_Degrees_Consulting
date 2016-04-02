class SponsorsController < ApplicationController
  
  def sponsor_params
    params.require(:sponsor).permit(:name, :email, :info)
  end
  
  def new
    @sponsor = Sponsor.new
  end
  

  def create
    @sponsor = Sponsor.new(sponsor_params)
    @sponsor.save
  end
  
end
