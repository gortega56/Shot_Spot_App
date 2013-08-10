class SearchController < ApplicationController

    def index
        @categories = Category.search_by_name(params[:query])
        @photosByName = Photo.search_by_title(params[:query])
        @photosByAddress = Photo.search_by_address(params[:query])
    end

end
