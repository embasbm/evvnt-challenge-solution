class Image < ActiveRecord::Base
  attr_accessible :image_url
  validates :image_url, presence: true
  validates_uniqueness_of :image_url, scope: :event_id
  belongs_to :event

  def self.save_in_local_db(event_id, main_image_url, image_urls_array)
    (main_image_url.split + image_urls_array).each do |image_url|
      self.find_or_create_by_event_id_and_image_url(event_id, image_url)
    end
  end
end
