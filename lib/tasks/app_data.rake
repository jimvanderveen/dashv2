require_relative "../../script/clear_data"
namespace :app_data do
  desc "Clear data from database (stash and datacite) and solr for environment"
  task clear: :environment do
    puts "Are you sure you want to clear the data in the environment #{Rails.env}?  (Type 'yes' to proceed.)"
    response = gets
    if response.strip.upcase == 'YES' && Rails.env != 'production'
      ClearData.clear
    end
  end
end
