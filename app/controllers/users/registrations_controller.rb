class Users::RegistrationsController < Devise::RegistrationsController
    
  respond_to :html, :json

  protected

  def after_sign_up_path_for(resource)
    '/an/example/path'
  end

  def after_inactive_sign_up_path_for(resource)
    '/an/example/path'
  end

end
