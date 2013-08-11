class CategoriesController < ApplicationController

    def index
        @categories = Category.search_by_name(params[:q])
        respond_to do |format|
          format.html
          format.json { render :json => @categories.map(&:attributes)}
        end
    end

    def show
        @category = Category.find(params[:id])
        @photos = @category.photos
    end

end
