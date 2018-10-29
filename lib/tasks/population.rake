namespace :population do
  desc "pull US states population in 2014, 2015, and 2016."
  task seed_populations: :environment do
    #Remove previous data in the database
    StatePopulation.destroy_all

    CSV.foreach(Rails.root.join("lib", "assets", "state_population_all.csv"), :headers => true) do |row|
      #to confirm row inspection
      puts row.inspect

      #get the state id of the current state from states database
      state = State.find_by_name(row['state_name'])

      #create new model instances with each row
      StatePopulation.create!(
        year_2016: row['year_2016'].to_i,
        year_2015: row['year_2015'].to_i,
        year_2014: row['year_2014'].to_i,
        state_id: state.id,
      )

      #confirm successfull completion of the task
      puts "There are now #{StatePopulation.count} rows in state_populations database."
    end
  end
end
