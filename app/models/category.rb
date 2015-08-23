class Category < ActiveRecord::Base
  attr_accessible :id, :name, :parent_id
  validates :name, presence: true

  has_many :events

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
