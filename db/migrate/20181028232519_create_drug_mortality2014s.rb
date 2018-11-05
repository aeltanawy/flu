class CreateDrugMortality2014s < ActiveRecord::Migration[5.2]
  def change
    create_table :drug_mortality2014s do |t|
      t.references :state, foreign_key: true
      t.integer :deaths

      t.timestamps
    end
  end
end
