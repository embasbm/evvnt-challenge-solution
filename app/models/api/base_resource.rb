module Api
  class BaseResource < ActiveResource::Base
    self.site = Figaro.env.api_site
    self.user = Figaro.env.api_username
    self.password = Figaro.env.api_password

    # Reasonable default
    self.timeout = 5
  end
end
