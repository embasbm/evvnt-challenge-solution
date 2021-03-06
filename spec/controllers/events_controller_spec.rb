require 'rails_helper'

describe EventsController do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

end
