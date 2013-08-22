class SearchController < ApplicationController

    def index
        @categories = Category.search_by_name(params[:query])
        @photosByName = Photo.search_by_title(params[:query])
        @photosByAddress = Photo.search_by_address(params[:query])
        @json = @photosByAddress.to_gmaps4rails do |photo, marker|
              marker.title photo.title
              marker.picture({
                  :picture => photo.image.url(:small),
                  :width   => 32,
                  :height  => 32
                 })
              marker.json({link: photo_path(photo)})
        end

    end

end
