module Api
  class BaseResource < ActiveResource::Base
    # Reasonable default
    self.timeout = 5
  end
end

