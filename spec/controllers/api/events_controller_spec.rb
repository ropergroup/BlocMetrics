require 'rails_helper'

RSpec.describe API::EventsController, type: :controller do

  let(:user){ create(:user) }
  let(:registered_application){ create(:registered_application, url: "test.com", user: user)}
  let!(:event){ registered_application.events.create(name: "test events")}

  context "URL corresponds to a registered app" do
    before do
      @request.env['HTTP_ORIGIN'] = "test.com"
      post :create, event: {name: "testing rspec"}
    end
    describe "create an event" do
      it "POST create successfully creates a new event" do
        expect(response).to have_http_status(:success)
      end

      it "Assures event name is set correctly" do
        expect(registered_application.events.find_by(name:"testing rspec")).not_to be_nil
      end
    end
  end

  describe "OPTIONS#preflight" do
    it "returns status 200" do
      get :preflight
      expect(response).to have_http_status(200)
      expect(response.headers["Access-Control-Allow-Headers"]).to eq("Content-Type")
    end
  end

end
