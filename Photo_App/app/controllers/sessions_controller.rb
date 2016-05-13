# SessionsController.rb
# Ryan Haines
# The controller for the login sessions. Holds the create and destroy methods to add and delete a session for
# a user.
class SessionsController < ApplicationController
  def new
  end

  # Starts a new session with a given user. (Login)
  def create
  	user = User.find_by(email: params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		redirect_back_or user
  	else
  		redirect_to login_path, notice: "Invalid email/password combination"
  	end
  end

  # Ends the session for the current user. (Logout)
  def destroy
  	log_out
  	redirect_to login_path
  end
end
