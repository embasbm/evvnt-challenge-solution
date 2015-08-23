class Link < ActiveRecord::Base
  attr_accessible :name, :url
  validates :url, presence: true

  belongs_to :event

  def self.save_in_local_db(event_id, links)
    links.each do |link|
      self.find_or_create_by_event_id_and_name_and_url(event_id, link[0], link[1])
    end
  end
end
