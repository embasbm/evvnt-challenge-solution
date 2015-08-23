require 'rails_helper'

describe EventController do

  describe "GET index" do
    it "returns http success" do
      controller.stub(:fetch_categories).and_return(nil)
      controller.stub(:fetch_events).and_return(nil)
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

end
