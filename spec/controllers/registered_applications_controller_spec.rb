require 'rails_helper'

RSpec.describe RegisteredApplication, type: :controller do
  include Devise::Test::ControllerHelpers

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "create" do
    it "creates registered application" do
      expect { post :create, :registered_application => {appname: "awesome app"}, user_id: @user.id }.to change(RegisteredApplication, :count).by(1)
    end
  end

  describe "destroy" do
    it "creates registered_application" do
      registered_application = FactoryGirl.create(:registered_application, user_id: @user.id)
      expect { delete :destroy, user_id: @user.id, id: registered_application.id }.to change(RegisteredApplication, :count).by(-1)
    end
  end
end
