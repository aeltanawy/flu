class StatePopulationsController < ApplicationController
  before_action :set_state_population, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_if_not_found

  # In case RecordNotFound
  def redirect_if_not_found
    logger.error "Attempt to access non-existent #{request.controller_class} '#{params[:id]}'."
    flash[:notice] = "Please use the filter instead."
    redirect_to(state_populations_path)
  end
  # GET /state_populations
  # GET /state_populations.json
  def index
    #Verifying the filter input text
    @filter_state = params[:filter_id]
    unless @filter_state.nil? || @filter_state.empty? || @filter_state.blank?
      @state = verify_filter(@filter_state)
    end

    @state_populations = StatePopulation.search(@state)
  end

  # GET /state_populations/1
  # GET /state_populations/1.json
  def show
  end

  # GET /state_populations/new
  def new
    @state_population = StatePopulation.new
    @states = State.all
  end

  # GET /state_populations/1/edit
  def edit
    @states = State.all
  end

  # POST /state_populations
  # POST /state_populations.json
  def create
    @states = State.all

    @state_population = StatePopulation.new(state_population_params)

    respond_to do |format|
      if @state_population.save
        format.html { redirect_to @state_population, notice: 'State population was successfully created.' }
        format.json { render :show, status: :created, location: @state_population }
      else
        format.html { render :new }
        format.json { render json: @state_population.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /state_populations/1
  # PATCH/PUT /state_populations/1.json
  def update
    respond_to do |format|
      if @state_population.update(state_population_params)
        format.html { redirect_to @state_population, notice: 'State population was successfully updated.' }
        format.json { render :show, status: :ok, location: @state_population }
      else
        format.html { render :edit }
        format.json { render json: @state_population.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /state_populations/1
  # DELETE /state_populations/1.json
  def destroy
    @state_population.destroy
    respond_to do |format|
      format.html { redirect_to state_populations_url, notice: 'State population was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state_population
      @state_population = StatePopulation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def state_population_params
      params.require(:state_population).permit(:year_2016, :year_2015, :year_2014, :state_id, :filter_id)
    end
end
