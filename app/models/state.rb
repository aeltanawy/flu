class State < ApplicationRecord
  def state_menu
    #To show the state id and name in the forms dropdown menu
    "#{state}, #{name}"
  end
end
