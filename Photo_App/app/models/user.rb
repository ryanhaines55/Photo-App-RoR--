class User < ActiveRecord::Base
has_many :photos
validates :name, presence: true, length: { maximum: 50 } # Makes sure that the users name is present
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # Creates a regex that recognizes a valid email string
validates :email, presence: true, length: { maximum: 255 }, # Makes sure that the users email is present with the valid
		  format: { with: VALID_EMAIL_REGEX }, uniqueness: true  # formatting
has_secure_password
validates :password, presence: true, length: { minimum: 8 }, allow_nil: true # Makes sure that the users password is 
end                                                                          # present with minimum value
