namespace :flu2014 do
  desc "TODO"
  task seed_mortalities: :environment do
    #get the database and csv file names
    n = n.to_s
    db = "FluMortality2014"
    db = db.constantize #to find the database top-level constant
    csv_file = "flu_mortality_2014"

    puts db
    puts csv_file

    #remove previous data in the database
    db.destroy_all

    CSV.foreach(Rails.root.join("lib", "assets", "#{csv_file}.csv"), :headers => true) do |row|
      #to confirm row inspection
      puts row.inspect

      #get the state id of the current state from states database
      state = State.find_by_state(row['state'])

      #remove the comma from deaths if present
      deaths = row['deaths'].gsub(/,/, "").to_i
      puts deaths #to confirm the deaths number has no comma

      #create new model instances with each row
      db.create!(
        state_id: state.id,
        deaths: deaths,
      )

      #confirm successfull completion of the task
      puts "There are now #{db.count} rows in #{db} database."
    end
  end

end
