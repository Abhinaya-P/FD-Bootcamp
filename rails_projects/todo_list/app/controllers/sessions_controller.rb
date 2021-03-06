class SessionsController < ApplicationController

  def new
  end 

  def create
  	@user = User.find_by_email(params[:session][:email])
  	if @user && @user.authenticate(params[:session][:password])
  		sign_in @user
  		flash[:success] = "You have successfully logged in"
  		redirect_to @user
  	else
      flash[:error] = "Invalid Username/password"
  		render 'new'
  	end
  end

  def destroy
  	sign_out 
    flash[:success] = "You have successfully logged out!"
  	redirect_to home_path
  end
end
