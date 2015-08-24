namespace :import do
  # desc 'Import Envent from Sandbox API'
  # task :categories_and_events => :environment do
  # end
  desc 'Import Envent from Sandbox API'
  task :events => :environment do
    begin 
      events = Api::Event.all
      events.each do |event|
        Event.find_or_create_from_attributes(event)
      end
    rescue => e
      Rails.logger.error "Error fetching events!!!\n #{e}"
    end
  end

  desc 'import Categories from Sandbox API'
  task :categories => :environment do

    def self.fetch_all_categories
    begin
      all_categories_data = Api::Category.find(:all)
    rescue ActiveResource::ResourceNotFound => e
      Rails.logger.debug "#{e}"
    rescue ActiveResource::ResourceConflict, ActiveResource::ResourceInvalid => e
      Rails.logger.debug "#{e}"
    end
    self.save_categories_data(all_categories_data) if all_categories_data.present?
  end

  def self.parent_categories
    Category.find(Category.all.group_by(&:parent_id).each.collect {|category| category[0]})
  end

  private

  def self.save_categories_data(categories_data)
    categories_data.each do |category|
      unless self.exists?(category.attributes[:id])
        existing_category = self.new
        existing_category.assign_attributes(category.attributes)
        existing_category.save
      end
    end
  end
  end
end



