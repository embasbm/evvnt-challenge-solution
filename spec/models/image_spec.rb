require 'rails_helper'

describe Image do
  it { should validate_presence_of(:image_url) }
  it { should validate_uniqueness_of(:image_url).scoped_to(:event_id) }
  it { should belong_to(:event)}
end
