class CreateStatePopulations < ActiveRecord::Migration[5.2]
  def change
    create_table :state_populations do |t|
      t.integer :year_2014
      t.integer :year_2015
      t.integer :year_2016
      t.references :state, foreign_key: true

      t.timestamps
    end
  end
end
