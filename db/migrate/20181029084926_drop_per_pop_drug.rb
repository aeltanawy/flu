class DropPerPopDrug < ActiveRecord::Migration[5.2]
  def change
    remove_column :drug_mortality2014s, :per_num_pop
    remove_column :drug_mortality2015s, :per_num_pop
    remove_column :drug_mortality2016s, :per_num_pop
  end
end
