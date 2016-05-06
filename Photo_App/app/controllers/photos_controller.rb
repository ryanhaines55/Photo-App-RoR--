# PhotosController.rb
# Ryan Haines
# Controller for the photo application. Holds all of the controller functions
# as well as image processing functions using the Rmagick Gem library.

require 'rubygems'
require 'rmagick'

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
  
  # Takes a specific photo and brings it to the edit page
  def edit
    @photo = Photo.find(params[:id])
      
  end

  # Updates the attributes of the photos in the edit page
  def update
      @photo = Photo.find(params[:id])
    if  @photo.update(photos_params)
      if @photo.save
        redirect_to photos_path, notice: "The photo has been updated"
    else
      render "edit"
      end
    end
  end

  # Editing functions taking advantage of the Rmagick gem library
  
  # Flip the specified image
  def flip
    @photo = Photo.find(params[:id])
    img = Magick::Image.read('public' + @photo.attachment_url).first
    img = img.flip!
    img.write('public' + @photo.attachment_url)
  end

  # Rotates the specified image by 90 degrees
  def rotate
    @photo = Photo.find(params[:id])
    img = Magick::Image.read('public' + @photo.attachment_url).first
    img = img.rotate(90)
    img.write('public' + @photo.attachment_url)
  end

  # Changes the specified image to black and white
  def black_and_white
    @photo = Photo.find(params[:id])
    img = Magick::Image.read('public' +  @photo.attachment_url).first
    img = img.quantize(256, Magick::GRAYColorspace)
    img.write('public' + @photo.attachment_url)
  end

  # Increases the size of the specified image
  def scale
    @photo = Photo.find(params[:id])
    img = Magick::Image.read('public' + @photo.attachment_url).first
    img = img.scale(1.5)
    img.write('public' + @photo.attachment_url)
  end

  # Adds a higher contrast to the specified image
  def sharpen
    @photo = Photo.find(params[:id])
    img = Magick::Image.read('public' + @photo.attachment_url).first
    img = img.sharpen(0.0, 1.0)
    img.write('public' + @photo.attachment_url)
  end

  # Adds a sepia tone to the specified image
  def sepia
    @photo = Photo.find(params[:id])
    img = Magick::Image.read('public' + @photo.attachment_url).first
    img = img.sepiatone()
    img.write('public' + @photo.attachment_url)
  end

  # Adds a blue shift to the specified image
  def blue_shift
    @photo = Photo.find(params[:id])
    img = Magick::Image.read('public' + @photo.attachment_url).first
    img = img.blue_shift(2)
    img.write('public' + @photo.attachment_url)
  end

  # Adds a charcoal effect to the specified image
  def charcoal
    @photo = Photo.find(params[:id])
    img = Magick::Image.read('public' + @photo.attachment_url).first
    img = img.charcoal(0.0, 1.0)
    img.write('public' + @photo.attachment_url)
  end
  
  # Unfinished. Eventually will make a photo collage
  def collage
    @photos = []
    @photos = Photo.where(:tag => 'dogs').limit(3)
    imgList = Magick::ImageList.new('public' + @photos[0].attachment_url,
                                'public' + @photos[1].attachment_url,
                                'public' + @photos[2].attachment_url)
    @img = Photo.new
    @img = imgList.append(true)
    @img.write('public/uploads/photo/attachment/collage.jpg')
  end   


  # Collects the fields for the photo object
  private
  	def photos_params
  		params.require(:photo).permit(:name, :attachment, :filename, :tag)
  	end

  # Method for sorting photo table by name
    def sort_col
      params[:sort] || "name"
    end

end
