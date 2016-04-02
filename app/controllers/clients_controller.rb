class ClientsController < ApplicationController
  
  def client_params
    params.require(:client).permit(:name, :email, :info)
  end
  
  def new
    @client = Client.new
  end
  

  def create
    @client = Client.new(client_params)
    @client.save
  end
  
end