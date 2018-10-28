class CreateStatePopulations < ActiveRecord::Migration[5.2]
  def change
    create_table :state_populations do |t|
      t.integer :year
      t.integer :number
      t.references :state, foreign_key: true

      t.timestamps
    end
  end
end
