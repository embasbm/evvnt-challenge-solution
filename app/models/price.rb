class Price < ActiveRecord::Base
  attr_accessible :category, :value

  belongs_to :event

  
end
