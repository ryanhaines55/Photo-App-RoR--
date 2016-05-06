class Photo < ActiveRecord::Base
mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
validates :name, presence: true # Make sure the owner's name is present.
validates :attachment, presence: true # Make sure the attachment is present.
validates :filename, presence: true # Make sure filename is present
end
