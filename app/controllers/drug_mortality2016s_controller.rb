class DrugMortality2016sController < ApplicationController
  before_action :set_drug_mortality2016, only: [:show, :edit, :update, :destroy]
  #validates :state, :uniqueness => true
  # GET /drug_mortality2016s
  # GET /drug_mortality2016s.json
  def index
    #Verifying the filter input text
    @filter_state = params[:filter_id]
    if @filter_state != ""
      @state = verify_filter(@filter_state)
    end

    @drug_mortality2016s = DrugMortality2016.search(@state)
  end

  # GET /drug_mortality2016s/1
  # GET /drug_mortality2016s/1.json
  def show
  end

  # GET /drug_mortality2016s/new
  def new
    @drug_mortality2016 = DrugMortality2016.new
    @states = State.all
  end

  # GET /drug_mortality2016s/1/edit
  def edit
    @states = State.all
  end

  # POST /drug_mortality2016s
  # POST /drug_mortality2016s.json
  def create
    @states = State.all
    
    @drug_mortality2016 = DrugMortality2016.new(drug_mortality2016_params)

    respond_to do |format|
      if @drug_mortality2016.save
        format.html { redirect_to @drug_mortality2016, notice: 'Drug mortality2016 was successfully created.' }
        format.json { render :show, status: :created, location: @drug_mortality2016 }
      else
        format.html { render :new }
        format.json { render json: @drug_mortality2016.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drug_mortality2016s/1
  # PATCH/PUT /drug_mortality2016s/1.json
  def update
    respond_to do |format|
      if @drug_mortality2016.update(drug_mortality2016_params)
        format.html { redirect_to @drug_mortality2016, notice: 'Drug mortality2016 was successfully updated.' }
        format.json { render :show, status: :ok, location: @drug_mortality2016 }
      else
        format.html { render :edit }
        format.json { render json: @drug_mortality2016.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drug_mortality2016s/1
  # DELETE /drug_mortality2016s/1.json
  def destroy
    @drug_mortality2016.destroy
    respond_to do |format|
      format.html { redirect_to drug_mortality2016s_url, notice: 'Drug mortality2016 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drug_mortality2016
      @drug_mortality2016 = DrugMortality2016.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drug_mortality2016_params
      params.require(:drug_mortality2016).permit(:state_id, :deaths, :filter_id)
    end
end
