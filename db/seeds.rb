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


 puts "Seed finished"
 puts "#{Item.count} items created"
 puts "#{User.count} users created"
