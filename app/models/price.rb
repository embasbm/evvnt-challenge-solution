class Price < ActiveRecord::Base
  attr_accessible :criteria, :value

  belongs_to :event
end
