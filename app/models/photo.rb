class Photo < ActiveRecord::Base
      #validates :shutter_speed, :aperture_value, :focal_length, numericality: true
      attr_reader :category_tokens
      belongs_to :user
      has_many :comments
      has_and_belongs_to_many :categories

      has_attached_file :image, source_file_options:  {all: '-auto-orient'},
                                                  convert_options: {all: '-auto-orient'},
                                                  styles: {small: "100x100>"},
                                                  url: "/assets/photos/:id/:style/:basename.:extension",
                                                  path: ":rails_root/public/assets/photos/:id/:style/:basename.:extension"

      before_post_process :read_exif
      validates_attachment_presence :image
      #validates_attachment_size :image, less_than: <size>
      #validates_attachment_content_type :image, content_type: []
      geocoded_by :address
      after_validation :geocode, :if => :address_changed?


      reverse_geocoded_by :latitude, :longitude, :address => :address
      after_validation :reverse_geocode

      acts_as_gmappable :process_geocoding => false

      def gmaps4rails_address
            self.address
      end

      def self.search_by_title(title)
          Photo.where("title LIKE :title OR description LIKE :title", title: "%#{title}%")
      end

      def self.search_by_address(address)
          Photo.near(address, 20)
      end

      def category_tokens=(tokens)
          self.category_ids = Category.ids_from_tokens(tokens)
      end

      private

      def read_exif
          image_path = image.queued_for_write[:original].path
          exif = Exiftool.new image_path
          exif_hash = exif.to_hash

          self.orientation           = exif_hash[:orientation]
          self.x_resolution         = exif_hash[:x_resolution]
          self.y_resolution         = exif_hash[:y_resolution]
          self.resolution_unit    = exif_hash[:resolution_unit]
        #  self.shutter_speed      = exif_hash[:shutter_speed]
          self.f_number              = exif_hash[:f_number]
          self.iso                          = exif_hash[:iso]
          self.date_time_original = exif_hash[:date_time_original]
          self.aperture_value       = exif_hash[:aperture_value]
          self.brightness             = exif_hash[:brightness]
          self.flash                       = exif_hash[:flash]
          self.focal_length           = exif_hash[:focal_length]
          self.color_space            = exif_hash[:color_space]
          self.exposure_mode      = exif_hash[:exposure_mode]
          self.white_balance          = exif_hash[:white_balance]
          self.capture_type             = exif_hash[:capture_type]
          self.altitude                     = exif_hash[:gps_altitude]
          self.latitude                     = exif_hash[:gps_latitude]
          self.longitude                  = exif_hash[:gps_longitude]
          self.width                        = exif_hash[:image_width]
          self.height                       = exif_hash[:image_height]
          self.compression            = exif_hash[:compression]
          self.light_value                = exif_hash[:light_value]
      end
end
