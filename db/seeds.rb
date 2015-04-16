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

# Country.delete_all
# City.delete_all
# Category.delete_all
# Tour.delete_all
# Tag.delete_all
# Location.delete_all
# CityTour.delete_all
# Country.reset_pk_sequence
# City.reset_pk_sequence
# Category.reset_pk_sequence
# Tour.reset_pk_sequence
# Tag.reset_pk_sequence
# Location.reset_pk_sequence
# CityTour.reset_pk_sequence





open("db/seeds/countries.txt") do |countries|
  countries.each do |country|
    codefips, codeiso, tld, name = country.chomp.force_encoding("ISO-8859-1").encode("utf-8", replace: nil).split(' ', 4)
    Country.create!(:name => name, :code => codeiso)
  end
end



require 'csv'
require 'pp'

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
  c = City.find_by(name: tour[4].downcase)
  # binding.pry
  t = c.tours.create!(category_id: tour[0] ,title: tour[1] , description: tour[2])
  # binding.pry
  t.tags.create!(name: tour[3])
  # binding.pry
end

locations = JSON.parse(File.read("db/seeds/locations.json"))
  locations.each do |location|
    tour = Tour.find_by(location[0])
    tour.locations.create(title: location[1], long: location[2], lat: location[3], step: location[4] )
  # Location.create!(category_id: tour[0] ,title: tour[1] , description: tour[2])
end


