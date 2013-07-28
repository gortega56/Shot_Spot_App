class Photo < ActiveRecord::Base

      belongs_to :user
      has_many :comments

      has_attached_file :image

      # validates_attachment_presence :image
      # validates_attachment_size :image, less_than: <size>
      # validates_attachment_content_type :image, content_type: []
end
