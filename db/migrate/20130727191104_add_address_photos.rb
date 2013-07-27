class AddAddressPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :address, :string
  end
end
