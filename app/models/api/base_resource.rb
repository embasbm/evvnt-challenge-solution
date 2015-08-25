module Api
  class BaseResource < ActiveResource::Base
    site = Figaro.env.api_site
    headers['Authorization'] = Figaro.env.api_key


    # Reasonable default
    self.timeout = 5
  end
end
