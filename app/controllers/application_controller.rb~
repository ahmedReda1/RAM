class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  before_action :authenticate_user!, only: [ :create ]
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.perm(:nickname , :email , :password , :isfemale , :aboutme , :country , :avatar) }
            
            #redirect_to(@user, :notice => 'User created')
      
	end
	#UserNotifier.send_signup_email(@user).deliver
end

