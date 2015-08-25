namespace :import do
  desc 'Import Categories and Events from Sandbox API'
  task :categories_and_events => :environment do

    events = Array.new(0)
    categories = Array.new(0)

    begin
      categories = Api::Category.all
    rescue => e
      Rails.logger.error "Error fetching Categories!!!\n #{e.inspect}"
    end
    Category.find_or_create_from_list(categories)

    begin
      events = Api::Event.all
    rescue => e
      Rails.logger.error "Error fetching events!!!\n #{e.inspect}"
    end
    Event.find_or_create_from_attributes(events)

  end
end



