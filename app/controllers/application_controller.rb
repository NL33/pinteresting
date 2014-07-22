class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?  # This creates a before action, saying configure permitted paramaters, and only if the devise controller is the controller in play. Devise controls stuff about users edit their account, login, etc… So this kicks in only if one of these is in play.]]

protected # this means only the application can see this

	def configure_permitted_parameters #this is copied from the gitub/devise description
  		devise_parameter_sanitizer.for(:sign_up) << :name #this is for signup   
   		devise_parameter_sanitizer.for(:account_update) << :name #his is for the account update page
	end

end

