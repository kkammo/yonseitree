# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'SETTING UP ADMIN USER'
user = User.create! :student_id => '001234', :user_name => 'admin', :email => 'admin@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :permit => true, :role => 'admin'
puts 'New user created: ' << user.user_name