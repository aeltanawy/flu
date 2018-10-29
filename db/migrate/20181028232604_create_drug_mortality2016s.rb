class CreateDrugMortality2016s < ActiveRecord::Migration[5.2]
  def change
    create_table :drug_mortality2016s do |t|
      t.references :state, foreign_key: true
      t.integer :deaths
      t.integer :per_num_pop

      t.timestamps
    end
  end
end
