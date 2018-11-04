class StatePopulation < ApplicationRecord
  belongs_to :state
  validates :year_2016, :year_2015, :year_2014, presence: true, numericality: { only_integer: true }

  def self.search(filter_id)
    if filter_id
      where(state_id: filter_id)
    else
      all
    end
  end
end
