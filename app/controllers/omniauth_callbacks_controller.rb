class EndUsers::OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def facebook
		callback_for(:facebook)
	end

	def twitter
		callback_for(:twitter)
	end

	def google_oauth2
		callback_for(:google)
	end


	def callback_for(provider)
		@end_user = User.from_omniauth(request.env["omniauth.auth"])
		if @end_user.persisted?
			sign_in_and_redirect @end_user, event: :authentication

			set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
		else
		  session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
		  redirect_to new_end_user_registration_url
		end
	  end

	def failure
		redirect_to root_path
	end

end
