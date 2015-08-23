class Event < ActiveRecord::Base
  attr_accessible :id, :category_id, :sub_category_id, :artists, :contact, :description, :door_time, :end_time, :hashtag, :keywords, :last_entry_time, :organiser_name, :package, :start_time, :summary, :timestamp, :title, :venue_id
  validates :title, :start_time, presence: true

  belongs_to :venue
  belongs_to :category
  has_many :images
  has_many :links
  has_many :prices


  def self.save_in_local_db(attributes, venue_id)
    venue_attribute = ActiveSupport::HashWithIndifferentAccess.new
    venue_attribute[:venue_id] = venue_id
    attributes.except!(:image_url, :image_urls, :links, :prices, :venue)
    attributes.merge!(venue_attribute)
    new_event = Event.new
    new_event.assign_attributes(attributes)
    new_event.save
  end
end
