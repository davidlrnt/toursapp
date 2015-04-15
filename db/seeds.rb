# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# require 'open-uri'
# require 'active_record/fixtures'

# ["Windows", "Linux", "Mac OS X"].each do |os|
#   OperatingSystem.find_or_create_by_name(os)
# end

# encoding: utf-8

Country.delete_all

# CSV.foreach("db/seeds/countries.rb") do |row|
# end


open("db/seeds/countries.txt") do |countries|
  countries.each do |country|
    codefips, codeiso, tld, name = country.chomp.force_encoding("ISO-8859-1").encode("utf-8", replace: nil).split(' ', 4)
    Country.create!(:name => name, :code => codeiso)
  end
end

binding.pry

# Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "operating_systems")
