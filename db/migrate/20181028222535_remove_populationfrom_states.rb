class RemovePopulationfromStates < ActiveRecord::Migration[5.2]
  def change
    remove_column :states, :population
  end
end