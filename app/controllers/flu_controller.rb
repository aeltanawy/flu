class FluController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_if_not_found

  # In case RecordNotFound
  def redirect_if_not_found
    logger.error "Attempt to access non-existent #{request.controller_class} '#{params[:id]}'."
    flash[:notice] = "Sorry, but #{request.controller_class} '#{params[:id]}' doesn't exist."
    redirect_to(root_path)
  end
  def index
    @flu_2016 = [['State', 'Flu Mortality']]
    @flu_2015 = [['State', 'Flu Mortality']]
    @flu_2014 = [['State', 'Flu Mortality']]

    databases = ['FluMortality2016', 'FluMortality2015', 'FluMortality2014']

    databases.each do |db|
      n = db[-1]
      db = db.constantize
      db.all.each do |rec|
        if n == '6'
          @flu_2016 << [rec.state.name, rec.deaths]
        elsif n == '5'
          @flu_2015 << [rec.state.name, rec.deaths]
        elsif n == '4'
          @flu_2014 << [rec.state.name, rec.deaths]
        end
      end
    end
  end
end
