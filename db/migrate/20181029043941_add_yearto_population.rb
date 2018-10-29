class AddYeartoPopulation < ActiveRecord::Migration[5.2]
  def change
    add_column :state_populations, :year_2016, :integer
    add_column :state_populations, :year_2015, :integer
    add_column :state_populations, :year_2014, :integer
    remove_column :state_populations, :number
  end
end
