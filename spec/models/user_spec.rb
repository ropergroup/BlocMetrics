require 'rails_helper'

RSpec.describe User, type: :model do
   let(:user) { FactoryGirl.create :user }

   it {should have_many (:registered_applications)}

   it { is_expected.to validate_presence_of(:email) }
   it { is_expected.to validate_uniqueness_of(:email) }
   it { is_expected.to allow_value("user@test.com").for(:email) }

   it { is_expected.to validate_presence_of(:password) }
   it { is_expected.to validate_length_of(:password).is_at_least(6) }

   describe "attributes" do
     it "should respond to email" do
       expect(user).to respond_to(:email)
     end
   end

   describe "invalid user" do
     let(:user_with_invalid_email) { User.new(email: "") }
     it "should be an invalid user due to blank email" do
       expect(user_with_invalid_email).to_not be_valid
     end
   end
end
