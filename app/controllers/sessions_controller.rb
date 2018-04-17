class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		user = User.where(email: params[:email])
		if user.password == params[password]
			session[:current_user_id] = user.id
		end
		if is_user_logged_in?
			redirect_to "/users/%s"%[current_user.id]
			flash[:notice] = "success"
		else
			redirect_to root_url
			flash[:notice] = "error"
		end
	end

	def destroy
		#complete this method
	end
end
