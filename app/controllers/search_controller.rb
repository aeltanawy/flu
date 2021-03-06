class SearchController < ApplicationController

  def show_state
    state = params[:state_id]
    unless state.nil? || state.empty? || state.blank?
      # Getting the state record from State database
      @state_id = verify_filter(state)
      @flash_triggered = @state_id.is_a?(String)
      # Checking if a flash notice has been triggered
      unless @flash_triggered
        @state_rec = State.find_by_id(@state_id)
        @state_name = @state_rec.name
        @state_state = @state_rec.state

        # Getting the flu and drug deaths for each year
        @flu_deaths = []
        @drug_deaths = []

        databases = ['FluMortality2016', 'FluMortality2015', 'FluMortality2014', 'DrugMortality2016', 'DrugMortality2015', 'DrugMortality2014']
        databases.each do |db|
          item = db.split('M')[0]
          db = db.constantize
          state_rec = db.find_by_state_id(@state_id)
          unless state_rec.nil? || state_rec.blank?
            if item == 'Flu'
              @flu_deaths << state_rec.deaths
            elsif item == 'Drug'
              @drug_deaths << state_rec.deaths
            end
          else
            if item == 'Flu'
              @flu_deaths << 0
            elsif item == 'Drug'
              @drug_deaths << 0
            end
          end
        end

        # Getting flu and drug CMR for each year
        @flu_cmr = []
        @drug_cmr = []
        $COL_NAME = 'year_201'

        @pop_rec = StatePopulation.find_by_state_id(@state_id)
        n = 0
        for i in 6.downto(4) do
          death = @flu_deaths[n]
          year = $COL_NAME + i.to_s
          @flu_cmr << calc_mortality_rate(death, @pop_rec[year.to_sym])
          n += 1
        end
        n = 0
        for i in 6.downto(4) do
          death = @drug_deaths[n]
          year = $COL_NAME + i.to_s
          @drug_cmr << calc_mortality_rate(death, @pop_rec[year.to_sym])
        end
      end
    else
      @message = "Your entry is blank.\nEnter a valid US state in search to view the full information."
    end
  end

end
