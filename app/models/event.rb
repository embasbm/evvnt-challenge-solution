class Event < ActiveRecord::Base
  attr_accessible :id, :category_id, :sub_category_id, :artists, :contact, :description, :door_time, :end_time, :hashtag, :keywords, :last_entry_time, :organiser_name, :package, :start_time, :summary, :timestamp, :title, :venue_id
  validates :title, :start_time, presence: true

  belongs_to :venue
  belongs_to :category
  has_many :images
  has_many :links
  has_many :prices

  def self.by_keyword(query) 
    where("title LIKE ? OR summary LIKE ? OR description LIKE ? OR keywords LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
  end

  def self.find_or_create_from_attributes(event)
    unless Event.exists?(event.id)
      venue = Venue.find_or_create_by_id(event.venue.attributes)
      event_attributes = event.attributes.except(:links, :image_url, :image_urls, :prices, :venue)
          .merge(venue_id: venue.id)
      new_event = Event.create(event_attributes)

      event.image_urls.push(event.image_url).uniq.each do |image_url|
        new_event.images.find_or_create_by_image_url(image_url)
      end

      event.prices.attributes.keys.each do |price_category|
        new_event.prices.create(category: price_category, value: event.prices.attributes[price_category])
      end
      
      event.links.attributes.keys.each do |link_name|
        new_event.links.create(name: link_name, url: event.link.attributes[link_name])
      end

    end
  end


end
