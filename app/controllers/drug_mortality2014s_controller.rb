class DrugMortality2014sController < ApplicationController
  before_action :set_drug_mortality2014, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_if_not_found

  # In case RecordNotFound
  def redirect_if_not_found
    logger.error "Attempt to access non-existent #{request.controller_class} '#{params[:id]}'."
    flash[:notice] = "Please use the filter instead."
    redirect_to(drug_mortality2014s_path)
  end

  # GET /drug_mortality2014s
  # GET /drug_mortality2014s.json
  def index
    #Verifying the filter input text
    @filter_state = params[:filter_id]
    unless @filter_state.nil? || @filter_state.empty? || @filter_state.blank?
      @state = verify_filter(@filter_state)
    end

    @drug_mortality2014s = DrugMortality2014.search(@state)
  end

  # GET /drug_mortality2014s/1
  # GET /drug_mortality2014s/1.json
  def show
  end

  # GET /drug_mortality2014s/new
  def new
    @drug_mortality2014 = DrugMortality2014.new
    @states = State.all
  end

  # GET /drug_mortality2014s/1/edit
  def edit
    @states = State.all
  end

  # POST /drug_mortality2014s
  # POST /drug_mortality2014s.json
  def create
    @states = State.all

    @drug_mortality2014 = DrugMortality2014.new(drug_mortality2014_params)

    respond_to do |format|
      if @drug_mortality2014.save
        format.html { redirect_to @drug_mortality2014, notice: 'Drug mortality2014 was successfully created.' }
        format.json { render :show, status: :created, location: @drug_mortality2014 }
      else
        format.html { render :new }
        format.json { render json: @drug_mortality2014.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drug_mortality2014s/1
  # PATCH/PUT /drug_mortality2014s/1.json
  def update
    respond_to do |format|
      if @drug_mortality2014.update(drug_mortality2014_params)
        format.html { redirect_to @drug_mortality2014, notice: 'Drug mortality2014 was successfully updated.' }
        format.json { render :show, status: :ok, location: @drug_mortality2014 }
      else
        format.html { render :edit }
        format.json { render json: @drug_mortality2014.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drug_mortality2014s/1
  # DELETE /drug_mortality2014s/1.json
  def destroy
    @drug_mortality2014.destroy
    respond_to do |format|
      format.html { redirect_to drug_mortality2014s_url, notice: 'Drug mortality2014 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drug_mortality2014
      @drug_mortality2014 = DrugMortality2014.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drug_mortality2014_params
      params.require(:drug_mortality2014).permit(:state_id, :deaths, :filter_id)
    end
end
