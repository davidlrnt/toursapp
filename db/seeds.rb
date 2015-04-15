# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require 'json'



Dir.open(./db/seeds/).entries.each do |file_name|
  binding.pry
end



open("db/seeds/countries.txt") do |countries|
  countries.each do |country|
    codefips, codeiso, tld, name = country.chomp.force_encoding("ISO-8859-1").encode("utf-8", replace: nil).split(' ', 4)
    Country.create!(:name => name, :code => codeiso)
  end
end
