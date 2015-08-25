namespace :import do
  desc 'Import Categories and Events from Sandbox API'
  task :categories_and_events => :environment do

    begin
      categories = Api::Category.all
      Category.find_or_create_from_list(categories)
    rescue => e
      Rails.logger.error "Error fetching Categories!!!\n #{e.inspect}"
    end

    begin
      events = Api::Event.all
      events.each do |event|
        Event.find_or_create_from_attributes(event)
      end
    rescue => e
      Rails.logger.error "Error fetching events!!!\n #{e.inspect}"
    end
  end
end



