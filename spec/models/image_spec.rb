require 'rails_helper'

describe Image do
  it { should validate_presence_of :image_url }
  it { should belong_to(:event)}
end
