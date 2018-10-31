class ChartController < ApplicationController
  def flu_mortality
    @map_2014 = []
    @map_2015 = []
    @map_2016 = []
    # to get all state names into an array
    @states = State.all
    @state_names = []
    @states.each do |state|
      @state_names << state.state
    end

    # to get 2016 Flu mortality into an array
    @flu_2016_db = FluMortality2016.all
    @flu_2016_deaths=[]
    @flu_2016_db.each do |row|
      state = @states.find(row['state_id'])
      us_state = 'us-' + state.state
      @flu_2016_deaths << row['deaths']
      @map_2016 << [us_state.downcase, row['deaths']]
    end

    # to get 2015 Flu mortality into an array
    @flu_2015_db = FluMortality2015.all
    @flu_2015_deaths=[]
    @flu_2015_db.each do |row|
      state = @states.find(row['state_id'])
      us_state = 'us-' + state.state
      @flu_2015_deaths << row['deaths']
      @map_2015 << [us_state.downcase, row['deaths']]
    end

    # to get 2014 Flu mortality into an array
    @flu_2014_db = FluMortality2014.all
    @flu_2014_deaths=[]
    @flu_2014_db.each do |row|
      state = @states.find(row['state_id'])
      us_state = 'us-' + state.state
      @flu_2014_deaths << row['deaths']
      @map_2014 << [us_state.downcase, row['deaths']]
    end
  end

  def drug_mortality
    # to get all state names into an array
    @states = State.all
    @state_names = []
    @states.each do |state|
      @state_names << state.state
    end

    # to get 2016 Flu mortality into an array
    @drug_2016_db = DrugMortality2016.all
    @drug_2016_deaths=[]
    @drug_2016_db.each do |row|
      @drug_2016_deaths << row['deaths']
    end

    # to get 2015 Flu mortality into an array
    @drug_2015_db = DrugMortality2015.all
    @drug_2015_deaths=[]
    @drug_2015_db.each do |row|
      @drug_2015_deaths << row['deaths']
    end

    # to get 2014 Flu mortality into an array
    @drug_2014_db = DrugMortality2014.all
    @drug_2014_deaths=[]
    @drug_2014_db.each do |row|
      @drug_2014_deaths << row['deaths']
    end
  end

  def flu_vs_drug
    @population_db = StatePopulation.all
    @flu_2016_db = FluMortality2016.all
    @drug_2016_db = DrugMortality2016.all
    @states = State.all
    @state_all = []
    @state_name = []
    @flu_rate = []
    @drug_rate = []
    @states.each do |state|
      @state_all << state.state
      @state_name << [state.state, state.name]
      pop = @population_db.find_by_state_id(state.id)
      flu = @flu_2016_db.find_by_state_id(state.id)
      drug = @drug_2016_db.find_by_state_id(state.id)
      flu_rate = calc_mortality_rate(flu.deaths, pop.year_2016)
      @flu_rate << flu_rate
      drug_rate = calc_mortality_rate(drug.deaths, pop.year_2016)
      @drug_rate << drug_rate
    end
  end

  def calc_mortality_rate(death, pop)
    rate = (death.to_f / pop) * 100000
    return rate.to_i
  end

end
