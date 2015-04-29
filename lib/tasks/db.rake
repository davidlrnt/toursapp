namespace :db do
  desc "Saves db to json file"
  task to_json: :environment do
    File.open("./db/seeds/locationsdump.json", 'w') do |file|
      Location.all.each do |location|
      file.write(location.to_json)
      end
    end
  end

end
