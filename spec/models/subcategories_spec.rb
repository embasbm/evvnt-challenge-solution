require 'rails_helper'

describe Category::Subcategory do
  it { should validate_presence_of :name }
end
