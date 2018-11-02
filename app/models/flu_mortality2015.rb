class FluMortality2015 < ApplicationRecord
  belongs_to :state

  def self.search(filter_id)
    if filter_id
      where(state_id: filter_id)
    else
      all
    end
  end
end
