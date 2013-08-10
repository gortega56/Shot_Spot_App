class CategoriesController < ApplicationController

    def index
        @categories = Category.all
    end

    def show
        @category = Category.where(params[Id])
        @photos = @category.photos
    end

end
