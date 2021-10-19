class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password]) #if the email and password match
      session[:user_id] = user.id                   #the user is logged in
      redirect_to root_url, notice: "Logged in!"
    else 
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"

  end
end
