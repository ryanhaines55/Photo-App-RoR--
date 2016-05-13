class Photo < ActiveRecord::Base
  belongs_to :user # Updated for final, sets up relationship with user
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true # Make sure the owner's name is present.
  validates :attachment, presence: true # Make sure the attachment is present.
  #validates :user_id, presence: true #Changed
end
