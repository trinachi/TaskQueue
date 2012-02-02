class Category < ActiveRecord::Base
  def self.names
    category = []
    Category.all.each do |x|
      category << [x.name, x.id]
    end
    return category
  end
end