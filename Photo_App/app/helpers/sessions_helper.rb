# Sessions_helper.rb
# Ryan Haines
# Contains helper methods for the sessions controller used to check
# for the correct user and login and logout users.
module SessionsHelper
	# Logs in a user
	def log_in(user)
		session[:user_id] = user.id
	end
	
	# Defines the current user
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	# Checks if the user is logged in
	def logged_in?
		!current_user.nil?
	end

	# Logs out a user
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end


	def current_user?(user)
		user == current_user
	end

	def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
end
