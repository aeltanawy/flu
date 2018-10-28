class CreateFluMortality2016s < ActiveRecord::Migration[5.2]
  def change
    create_table :flu_mortality2016s do |t|
      t.references :state, foreign_key: true
      t.integer :deaths

      t.timestamps
    end
  end
end
