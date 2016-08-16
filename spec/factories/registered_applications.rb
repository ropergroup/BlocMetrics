FactoryGirl.define do
  factory :registered_application do
    appname Faker::Hipster.word
    url Faker::Hipster.word
    user
  end
end
