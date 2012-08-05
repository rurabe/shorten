class SessionsController < ApplicationController
  def create
  	user = User.find_by_email(params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
  		sign_in user
  		redirect_to 'urls#new'
  	else
  		flash[:error] = "Invalid email or password"
  		render 'urls#new'
  	end
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end
end
