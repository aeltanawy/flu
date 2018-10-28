namespace :states do
  desc "pull US states data into states database"
  task seed_states: :environment do
    #Remove previous data in the database
    State.destroy_all

    CSV.foreach(Rails.root.join("lib", "assets", "states.csv"), :headers => true) do |row|
      #to confirm row inspection
      puts row.inspect

      #create new model instances with each row
      State.create!(
        state: row['state'].to_s,
        name: row['name'].to_s,
      )

      #confirm successfull completion of the task
      puts "There are now #{State.count} rows in states database."
    end
  end
end
