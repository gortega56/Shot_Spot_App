class Photo < ActiveRecord::Base

      belongs_to :user
      has_many :comments

      has_attached_file :image, styles: {small: "100x100>"},
                                                  url: "/assets/photos/:id/:style/:basename.:extension",
                                                  path: ":rails_root/public/assets/photos/:id/:style/:basename.:extension"

      validates_attachment_presence :image
      #validates_attachment_size :image, less_than: <size>
      #validates_attachment_content_type :image, content_type: []
end
