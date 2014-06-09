# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Started Rake task for Creating Admin"
writer = Writer.where(:email => "admin@gmail.com",:password => "admin123",:is_admin => true,:first_name => "Admin").first_or_create
writer.new_record? ? (puts "Admin Already Present in DB !!!"): (puts "Admin Created Successfully !!!")
