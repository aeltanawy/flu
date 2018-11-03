class FluController < ApplicationController
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
