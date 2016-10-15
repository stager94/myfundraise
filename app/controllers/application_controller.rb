class ApplicationController < ActionController::Base

	include CanCan::ControllerAdditions

	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :reset_session

	before_action :configure_permitted_parameters, if: :devise_controller?

protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :nick])
		# devise_parameter_sanitizer.for(:account_update).push(:name, :surname, :email, :avatar)
	end

private

	def check_user_verifying
		return if !current_user || current_user.email_verified? || !request.get?
		redirect_to finish_signup_path(current_user)
	end

	def after_sign_in_path_for(resource)
		root_path
	end

	def after_sign_out_path_for(resource_or_scope)
		# request.referrer
		root_path
	end
	
end
