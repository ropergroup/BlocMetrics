require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::Test::ControllerHelpers


   before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
   end

   describe "GET show" do
	    it "returns http success" do
	      get :show
      expect(response).to have_http_status(:success)
	    end
	  end

 end
