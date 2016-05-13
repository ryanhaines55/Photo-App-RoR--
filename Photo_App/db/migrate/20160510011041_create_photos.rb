class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :attachment
      t.string :tag
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :photos, [:user_id, :created_at]
  end
end
