class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		user = User.find_by_email(user_params[:email])
		if user.present? && user.password == user_params[:password] && !user.password.nil?
			session[:current_user_id] = user.id
		else
			session[:current_user_id] = nil
		end
		if is_user_logged_in?
			flash[:notice] = "success"
			redirect_to :controller => :users, :action => :show, :id => user.id
		else
			flash[:notice] = "error"
      root_path
		end
	end

	def destroy
		#complete this method
	end
private
	def user_params
		params.require(:session).permit(:email, :password)
	end
end
