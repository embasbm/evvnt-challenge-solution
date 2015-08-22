class Event < ActiveRecord::Base
  attr_accessible :artists, :contact, :description, :door_time, :end_time, :hashtag, :keywords, :last_entry_time, :organiser_name, :package, :start_time, :summary, :timestamp, :title
  validates :title, :start_time, presence: true
  has_many :images
  has_many :links
  has_many :prices
end
