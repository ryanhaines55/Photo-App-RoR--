class PhotosController < ApplicationController
  
  # Accumulates the photos table and stores each photo into an instance of the @photos 
  # object in order by name
  
  def index
  	@photos = Photo.order(sort_col)
  end

  # Creates a new photo object

  def new
  	@photo = Photo.new
  end

  # Creates a new photo object with parameters specifed by the photos_params 
  # method. Then redirects back to index page and prints a confirmation message.
  
  def create
  	@photo = Photo.new(photos_params)

  	if @photo.save
  		redirect_to photos_path, notice: "The photo #{@photo.name} has been uploaded."
  	else
  		render "new"
  	end

  end
  
  # Will find the photo object with a specific id and delete it
  
  def destroy
  	@photo = Photo.find(params[:id])
  	@photo.destroy
  	redirect_to photos_path, notice: "The photo #{@photo.name} has been deleted."
  end
  
  # Not finished
  def edit
  @photo = Photo.find(params[:id])
  end

  # Collects the fields for the photo object
  private
  	def photos_params
  		params.require(:photo).permit(:name, :attachment)
  	end

  # Method for sorting photo table by name
    def sort_col
      params[:sort] || "name"
    end

end
