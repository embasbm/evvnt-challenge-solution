class Category < ActiveRecord::Base
  attr_accessible :id, :name, :parent_id
  validates :name, presence: true

  has_many :events
end
