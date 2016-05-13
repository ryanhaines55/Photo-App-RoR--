# UsersContoller.rb
# Ryan Haines
# The controller for the user. Holds the functions to create, delete, update/edit, and display user info.

class UsersController < ApplicationController
 before_action :logged_in_user, only: [:show, :edit, :update, :destroy] # Only a logged in user can use these actions
 before_action :correct_user, only: [:show, :edit, :update] # Only the correct user can perform these actions
  
  # Not working
  def index
    @user = User.all
  end

  # Shows the table for the users photos. Not functioning yet
  def show
  	@user = User.find(params[:id])
  	@photos = @user.photos.order(sort_col)
  end


  # Defines a new user
  def new
  	@user = User.new
  end

  # Creates a new user and stores it to the database
  def create
  	@user = User.new(user_params)
  	if @user.save
  		log_in @user
  		redirect_to @user, notice: "Creation successful, Welcome!"
  	else
  		render 'new'
  	end
  end

  # Edit the current user
  def edit
    @user = User.find(params[:id])
  end

  # Allows for changes to be made to user attributes
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, notice: "Profile updated"
    else
      render 'edit'
    end
  end

  # Deletes specific user. Should be done with an admin. Not working
  def destroy
    User.find(params[:id].destroy)
    redirect_to root_url, notice: "User deleted"
  end

  private

    # Parameters for the user
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end

     # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        redirect_to login_url, notice: "Please log in."
      end
    end

    # Confirms if it is the correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
    end

    # Will sort the users photos in alphanumerical order
  	def sort_col
      params[:sort] || "name"
    end


end
