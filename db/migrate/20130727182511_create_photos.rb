class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
