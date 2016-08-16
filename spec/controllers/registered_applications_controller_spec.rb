require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "create" do
   it "creates registered application" do
      expect { post :create, user_id: @user.id, id: registered_application.id, post: {appname: "awesome app", url: "www.test.com"}  }.to change(RegisteredApplication, :count).by(1)
    end
  end

  describe "destroy" do
   it "creates registered_application" do
     registered_application = FactoryGirl.create(:registered_application, user_id: @user.id)
      expect { delete :destroy, user_id: @user.id, id: registered_application.id }.to change(RegisteredApplication, :count).by(-1)
    end
  end
end
