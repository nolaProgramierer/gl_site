class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if
      user && user.authenticate(params[:session][:password])
      # Log in user and redirect to user's page
    else
      flash[:danger] = 'Invalid name/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
