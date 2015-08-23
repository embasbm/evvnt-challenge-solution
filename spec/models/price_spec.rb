require 'rails_helper'

describe Price do
  it { should belong_to(:event)}
end
