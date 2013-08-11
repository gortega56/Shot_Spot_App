class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :thumb => "100x100>" },
                                              :default_url => "/images/:style/missing.png",
                                              url: "/assets/users/:id/:style/:basename.:extension",
                                              path: ":rails_root/public/assets/users/:id/:style/:basename.:extension"
  has_many :photos
  has_many :comments

end
