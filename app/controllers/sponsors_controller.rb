class SponsorsController < ApplicationController
  def new
    @sponsor = Sponsor.new
  end

  def create
    @sponsor = Sponsor.new(params[:client])
    @sponsor.request = request
    if @sponsor.deliver
      flash.now[:error] = nil
      flash.now[:notice] = 'Thank you for your message!'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end