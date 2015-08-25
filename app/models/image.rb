class Image < ActiveRecord::Base
  attr_accessible :image_url
  validates :image_url, presence: true
  validates_uniqueness_of :image_url, scope: :event_id
  belongs_to :event

end
