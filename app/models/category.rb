class Category < ActiveRecord::Base
  attr_accessible :id, :name, :parent_id
  validates :name, presence: true

  has_many :events

  def self.find_or_create_from_list(categories_set)
    categories_set.each do |category|
      unless self.exists?(category.id)
        Category.create(category.attributes)
      end
    end
  end
end
