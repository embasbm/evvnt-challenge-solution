require 'rails_helper'

describe Venue do
  it { should validate_presence_of :name }
  it { should have_many(:events)}
end