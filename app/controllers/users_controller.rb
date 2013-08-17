class UsersController < ApplicationController
before_action :load_user, only: [:show, :edit, :update]
  def show
    @photos = @user.photos
  end

  def edit

  end

  def update
    if @user.update_attributes(safe_params)
          redirect_to @user
    else
          render :edit
    end
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def safe_params
    params.require(:user).permit(:name, :avatar)
  end

end
