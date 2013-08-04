class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
    @comment = @photo.comments.new
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(safe_params)

    @photo.user = current_user

    if (@photo.save)
      redirect_to @photo
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

private
  def safe_params
    params.require(:photo).permit(:title, :description, :address, :image,:latitude, :longitude,
                                                          :orientation, :x_resolution, :y_resolution, :resolution_unit,
                                                          :shutter_speed, :f_number, :iso, :date_time_original, :aperture_value,
                                                          :brightness, :flash, :focal_length, :color_space, :exposure_mode,
                                                          :white_balance, :capture_type, :altitude, :compression, :width, :height,
                                                          :light_value)
  end
end
