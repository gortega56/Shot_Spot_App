class AddExifColumnsToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :orientation, :string
    add_column :photos, :x_resolution, :integer
    add_column :photos, :y_resolution, :integer
    add_column :photos, :resolution_unit, :string
    add_column :photos, :shutter_speed, :decimal
    add_column :photos, :f_number, :float
    add_column :photos, :iso, :integer
    add_column :photos, :date_time_original, :timestamp
    add_column :photos, :aperture_value, :float
    add_column :photos, :brightness, :float
    add_column :photos, :flash, :string
    add_column :photos, :focal_length, :string
    add_column :photos, :color_space, :string
    add_column :photos, :exposure_mode, :string
    add_column :photos, :white_balance, :string
    add_column :photos, :capture_type, :string
    add_column :photos, :altitude, :string
    add_column :photos, :compression, :string
    add_column :photos, :width, :integer
    add_column :photos, :height, :integer
    add_column :photos, :light_value, :float
  end
end
