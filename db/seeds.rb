# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |u|
  User.create! name: "User" + (u+1).to_s,
  email: "user#{u+1}@gmail.com",
  password: "123456",
  password_confirmation: "123456"
end
