class AddTagToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :tag, :string
  end
end
