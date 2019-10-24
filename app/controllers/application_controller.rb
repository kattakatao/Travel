class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	#before_action :authenticate_end_user!

	 before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
  	if end_user_signed_in?
  		  end_user_path(current_end_user.id)
  	elsif admin_user_signed_in?
        posts_path
  	end

  end

  def after_sign_out_path_for(resource)
	  about_top_path
  end

protected
  def configure_permitted_parameters
      #added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
      #devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      #devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
      #devise_parameter_sanitizer.permit :account_update, keys: added_attrs

      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  		devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end