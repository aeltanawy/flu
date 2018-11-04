class DrugMortality2014 < ApplicationRecord
  belongs_to :state
  validates :deaths, presence: true, numericality: { only_integer: true }

  def self.search(filter_id)
    if filter_id
      where(state_id: filter_id)
    else
      all
    end
  end
end
