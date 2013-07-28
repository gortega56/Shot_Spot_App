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
    params.require(:photo).permit(:title, :description, :address, :image)
  end
end
