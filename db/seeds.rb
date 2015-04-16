# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require 'json'



# encoding: utf-8


Country.delete_all
City.delete_all
Category.delete_all




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

