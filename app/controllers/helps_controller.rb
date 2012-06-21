class HelpsController < ApplicationController
  def new
    @title = "Help"
    @help = Help.new
  end
  
  def create
    @help = Help.new(params[:help])
    if @help.save
      redirect_to root_path, :notice => 'Help ticket successfully created. You should be contacted soon.'
    else
      flash.now[:notice] = "Error while creating the help ticket. Try again."
      render :new
    end
  end
end
