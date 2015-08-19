class Image < ActiveRecord::Base
  attr_accessible :image_url
  validates :image_url, presence: true
end
