require 'rails_helper'

describe Event do
  it { should validate_presence_of :title }

  it { should belong_to(:venue)}
  it { should belong_to(:category)}
  it { should have_many(:images)}
  it { should have_many(:links)}
  it { should have_many(:prices)}
end