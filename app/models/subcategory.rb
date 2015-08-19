class Subcategory < Category
  attr_accessible :name
  validates :name, presence: true
end