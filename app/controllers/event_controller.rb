class EventController < ApplicationController
  include AbstractController::Callbacks

  after_filter :fetch_categories, :fetch_events

  def index
    # debugger
  end

  private

  def fetch_categories
    Category.fetch_all_categories
  end

  def fetch_events
    begin
      event_list = Api::Event.all
    rescue ActiveResource::ResourceNotFound => e
      Rails.logger.debug "#{e}"
    rescue ActiveResource::ResourceConflict, ActiveResource::ResourceInvalid => e
      Rails.logger.debug "#{e}"
    rescue Timeout::Error => e
      Rails.logger.debug "#{e}"
    end
    save_in_local_db(event_list) if event_list.present?
  end

  def save_in_local_db(event_list)
    event_list.each do |event|
      unless Event.exists?(event.id)
        Image.save_in_local_db(event.id, event.image_url, event.image_urls)
        Link.save_in_local_db(event.id, event.links.attributes)
        Price.save_in_local_db(event.id, event.prices.attributes)
        Venue.save_in_local_db(event.venue.attributes)
        Event.save_in_local_db(event.attributes, event.venue.attributes[:id])
      end
    end
  end
end
