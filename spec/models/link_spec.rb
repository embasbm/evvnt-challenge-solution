require 'rails_helper'

describe Link do
  it { should validate_presence_of(:url) }
  it { should belong_to(:event)}
end
