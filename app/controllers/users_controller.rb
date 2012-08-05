class UsersController < ApplicationController

	def create
		@user = User.new(params[:user])
		@user.save
		sign_in(@user)
		redirect_to new_url_path
	end
end
