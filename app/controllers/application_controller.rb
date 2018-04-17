class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def current_user
	#complete this method
    cuser = User.find(session[:current_user_id])
    return cuser
  end

  def is_user_logged_in?
	#complete this method
  	logged_in = false
    if session[:current_user_id].present? && !session[:current_user_id].nil?
      logged_in = true
    end
	  if logged_in then true else redirect_to root_path end
    return logged_in
  end
end
