class CreateCategorization < ActiveRecord::Migration
  def change
    create_table :categories_photos, id: false do |t|
      t.integer :photo_id
      t.integer :category_id
    end
  end
end
