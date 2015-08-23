class Price < ActiveRecord::Base
  attr_accessible :criteria, :value

  belongs_to :event

  def self.save_in_local_db(event_id, prices)
    prices.each do |price|
      Price.find_or_create_by_event_id_and_criteria_and_value(event_id, price[0].chomp(), price[1])
    end
  end
end
