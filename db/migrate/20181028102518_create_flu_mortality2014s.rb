class CreateFluMortality2014s < ActiveRecord::Migration[5.2]
  def change
    create_table :flu_mortality2014s do |t|
      t.references :state, foreign_key: true
      t.integer :deaths

      t.timestamps
    end
  end
end
