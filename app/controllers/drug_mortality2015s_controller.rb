class DrugMortality2015sController < ApplicationController
  before_action :set_drug_mortality2015, only: [:show, :edit, :update, :destroy]
  #validates :state, :uniqueness => true
  # GET /drug_mortality2015s
  # GET /drug_mortality2015s.json
  def index
    #Verifying the filter input text
    @filter_state = params[:filter_id]
    if @filter_state != ""
      @state = verify_filter(@filter_state)
      puts @state
    end

    @drug_mortality2015s = DrugMortality2015.search(@state)
  end

  # GET /drug_mortality2015s/1
  # GET /drug_mortality2015s/1.json
  def show
  end

  # GET /drug_mortality2015s/new
  def new
    @drug_mortality2015 = DrugMortality2015.new
    @states = State.all
  end

  # GET /drug_mortality2015s/1/edit
  def edit
    @states = State.all
  end

  # POST /drug_mortality2015s
  # POST /drug_mortality2015s.json
  def create
    @drug_mortality2015 = DrugMortality2015.new(drug_mortality2015_params)

    respond_to do |format|
      if @drug_mortality2015.save
        format.html { redirect_to @drug_mortality2015, notice: 'Drug mortality2015 was successfully created.' }
        format.json { render :show, status: :created, location: @drug_mortality2015 }
      else
        format.html { render :new }
        format.json { render json: @drug_mortality2015.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drug_mortality2015s/1
  # PATCH/PUT /drug_mortality2015s/1.json
  def update
    respond_to do |format|
      if @drug_mortality2015.update(drug_mortality2015_params)
        format.html { redirect_to @drug_mortality2015, notice: 'Drug mortality2015 was successfully updated.' }
        format.json { render :show, status: :ok, location: @drug_mortality2015 }
      else
        format.html { render :edit }
        format.json { render json: @drug_mortality2015.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drug_mortality2015s/1
  # DELETE /drug_mortality2015s/1.json
  def destroy
    @drug_mortality2015.destroy
    respond_to do |format|
      format.html { redirect_to drug_mortality2015s_url, notice: 'Drug mortality2015 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drug_mortality2015
      @drug_mortality2015 = DrugMortality2015.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drug_mortality2015_params
      params.require(:drug_mortality2015).permit(:state_id, :deaths, :filter_id)
    end
end
