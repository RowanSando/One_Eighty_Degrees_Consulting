class ClientsController < ApplicationController
  
  def user_params
    params.require(:client).permit(:name, :email, :info)
  end
  
  def new
    @client = Client.new
  end
  

  def create
    @client = Client.new(user_params)
    @client.save
  end
  
end