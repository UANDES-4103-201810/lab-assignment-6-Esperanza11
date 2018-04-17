class RegistrationsController < ApplicationController

	def new
	
	end

	def create
	    #complete this method
		user = User.create(user_params)
		if user.save
			redirect_to root_url
			flash[:notice] = "success"
		else
			redirect_to registrations_url
			flash[:notice] = "you probably missed a field, try again"
		end
	end

	private
	def user_params
		params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
	end
end
