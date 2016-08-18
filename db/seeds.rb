require 'faker'


# Create User
10.times do
  User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password
  )
  end
  users = User.all

# Create Appname & URL
20.times do
  RegisteredApplication.create!(
  user: users.sample,
  appname: Faker::Commerce.product_name,
  url: Faker::Internet.url
  )
  end
  registered_applications = RegisteredApplication.all

# Create Events
  120.times do
    Event.create!(
    registered_application: registered_applications.sample,
    name: Faker::Hacker.verb,
    )
    end
    events = Event.all


 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{RegisteredApplication.count} registered_applications created"
 puts "#{Event.count} events created"
