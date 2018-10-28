namespace :flu_mortality do
  desc "pull US states Flu mortality"
  task seed_mortalities: :environment do
    #Remove previous data in the database
    FluMortality.destroy_all

    CSV.foreach(Rails.root.join("lib", "assets", "flu_mortality_by_state.csv"), :headers => true) do |row|
      #to confirm row inspection
      puts row.inspect

      #create new model instances with each row
      FluMortality.create!(
        state: row[0].to_s,
        deaths: row[2].to_i,
      )

      #confirm successfull completion of the task
      puts "There are now #{FluMortality.count} rows in flu_mortalities database."
    end
  end
end
