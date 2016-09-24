class ApplicationController < ActionController::Base

	include CanCan::ControllerAdditions

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_user_verifying

private

	def check_user_verifying
		return if !current_user || current_user.email_verified? || !request.get?
		redirect_to finish_signup_path(current_user)
	end

end
