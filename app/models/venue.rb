class Venue < ActiveRecord::Base
  attr_accessible :id, :address_1, :address_2, :country, :latitude, :longitude, :name, :postcode, :town
  validates :name, presence: true

  has_many :events

  def self.save_in_local_db(venue)
    unless self.exists?(venue[:id])
      existing_venue = self.new
      existing_venue.assign_attributes(venue)
      existing_venue.save
    end
  end
end
