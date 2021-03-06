module ApplicationHelper
  def verify_filter(filter_id)
    #Verifying the filter input text
    filter = filter_id.to_s
    filter = filter.rstrip
    cont = false
    if filter.length == 2
      cont = true
      @col_name = 'state'
      filter = filter.upcase
    elsif filter.length > 2
      cont = true
      @col_name = 'name'
      filter = filter.capitalize
    end
    if cont
      state_id = get_state(@col_name, filter)
      return state_id
    end
  end

  def get_state(col_name, val)
    rec = Hash[col_name, val]
    if State.exists?(rec)
      state = State.all.where(rec)
      return state.ids
    else
      flash.now[:notice] = "Sorry, but '#{val}' doesn't exist. Enter a valid US state."
    end
  end

  # calculate the Crude Mortality Rate
  def calc_mortality_rate(death, pop)
    rate = (death.to_f / pop) * 100000
    return rate.to_i
  end
end
