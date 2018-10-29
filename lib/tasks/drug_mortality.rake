namespace :drug_mortality do
  desc "pull US states Drug mortalities 2014, 2015, and 2016."
  task seed_mortalities: :environment do
    #get the database and csv file names
    (4..6).each do |n|
      n = n.to_s
      db = "DrugMortality201" + n
      db = db.constantize #to find the database top-level constant
      csv_file = "drug_mortality_201" + n

      puts db
      puts csv_file

      #remove previous data in the database
      db.destroy_all

      CSV.foreach(Rails.root.join("lib", "assets", "#{csv_file}.csv"), :headers => true) do |row|
        #to confirm row inspection
        puts row.inspect

        #get the state id of the current state from states database
        state = State.find_by_name(row['state_name'])

        #create new model instances with each row
        db.create!(
          state_id: state.id,
          deaths: row['deaths'].to_i,
          per_num_pop: row['per_num_pop'].to_i
        )

        #confirm successfull completion of the task
        puts "There are now #{db.count} rows in #{db} database."
      end
    end
  end
end
