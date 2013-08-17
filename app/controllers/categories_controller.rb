class CategoriesController < ApplicationController

    def index
        @categories = Category.search_by_name(params[:q])

        if @categories.empty?
            @categories = [{id: "<<<#{params[:q]}>>>", name: "New: \"#{params[:q]}\""}]
        end

        respond_to do |format|
          format.html
          format.json { render :json => @categories }
        end
    end

    def show
        @category = Category.find(params[:id])
        @photos = @category.photos
    end
end
