class Link < ActiveRecord::Base
  attr_accessible :name, :url
  validates :url, presence: true

  belongs_to :event

  
end
