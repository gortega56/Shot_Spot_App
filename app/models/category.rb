class Category < ActiveRecord::Base
          has_and_belongs_to_many :photos

          def self.search_by_name(name)
              Category.where("name LIKE :name", name: "%#{name}%")
          end

end
