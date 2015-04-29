# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require 'json'
# encoding: utf-8

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'
  # MySQL and PostgreSQL
  # ActiveRecord::Base.connection.execute("TRUNCATE #{table}")

  # SQLite
  ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
end

open("db/seeds/countries.txt") do |countries|
  countries.each do |country|
    codefips, codeiso, tld, name = country.chomp.force_encoding("ISO-8859-1").encode("utf-8", replace: nil).split(' ', 4)
    Country.create!(:name => name, :code => codeiso)
  end
end

require 'csv'
require 'pp'

badges = JSON.parse(File.read("db/seeds/badges.json"))
  badges.each do |badge|
    badge = Badge.create(name: badge[0], requirement: badge[1], badge_type: badge[2], description: badge[3] )
  end

users = JSON.parse(File.read("db/seeds/users.json"))
  users.each do |user|
    user = User.create(user)
  end

File.foreach("db/seeds/cities.csv", :quote_char => "\'") do |csv_line|
  row = CSV.parse(csv_line.gsub('"', '\''))
  c = Country.find_by(:code => row.first[0].upcase)
  unless c.nil?
  c.cities.create(name: row.first[1], accent: row.first[2], region: row.first[3], lat: row.first[5], long: row.first[6])
  end
end

categories = JSON.parse(File.read("db/seeds/categories.json"))
  categories["Categories"].each do |category|
  Category.create!(name: category)
end

tours = JSON.parse(File.read("db/seeds/tours.json"))
  tours.each do |tour|
  c = City.find_by(name: tour["city"].downcase)
  t = c.tours.create!(category_id: tour["category_id"] ,title: tour["title"] , description: tour["description"], guide_id: tour["guide_id"], published: tour["published"] )
  t.images.create(image_url: tour["image"])
  tour["tags"].each do |tag|
  t.tags.create!(name: tag.downcase)
  end
end

comments = JSON.parse(File.read("db/seeds/comments.json"))
comments.each do |comment|
  Comment.create!(participant_id: comment["participant_id"], location_id: comment["location_id"], tour_id: comment["tour_id"], content: comment["content"])
end


locations = JSON.parse(File.read("db/seeds/locations.json"))
  locations.each do |location|
    tour = Tour.find_by_id(location["tour_id"])
    l = tour.locations.create(title: location["title"], address: location["address"], description: location["description"], lat: location["lat"], lng: location["lng"] )
    l.images.create(image_url: location["image"])
end

reviews = JSON.parse(File.read("db/seeds/reviews.json"))
  reviews.each do |review|
    r = Review.create!(review)
    r.tour.set_average
    r.tour.guide.set_average
end
