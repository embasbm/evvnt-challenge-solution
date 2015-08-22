class Venue < ActiveRecord::Base
  attr_accessible :address_1, :address_2, :country, :latitude, :longitude, :name, :postcode, :town
  validates :name, presence: true

  has_many :events
end
