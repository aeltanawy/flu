class FluMortality2016sController < ApplicationController
  before_action :set_flu_mortality2016, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_if_not_found

  # In case RecordNotFound
  def redirect_if_not_found
    logger.error "Attempt to access non-existent #{request.controller_class} '#{params[:id]}'."
    flash[:notice] = "Please use the filter instead."
    redirect_to(flu_mortality2016s_path)
  end
  # GET /flu_mortality2016s
  # GET /flu_mortality2016s.json
  def index
    #Verifying the filter input text
    @filter_state = params[:filter_id]
    unless @filter_state.nil? || @filter_state.empty? || @filter_state.blank?
      @state = verify_filter(@filter_state)
    end

    @flu_mortality2016s = FluMortality2016.search(@state)
  end

  # GET /flu_mortality2016s/1
  # GET /flu_mortality2016s/1.json
  def show
  end

  # GET /flu_mortality2016s/new
  def new
    @flu_mortality2016 = FluMortality2016.new
    @states = State.all
  end

  # GET /flu_mortality2016s/1/edit
  def edit
    @states = State.all
  end

  # POST /flu_mortality2016s
  # POST /flu_mortality2016s.json
  def create
    @states = State.all

    @flu_mortality2016 = FluMortality2016.new(flu_mortality2016_params)

    respond_to do |format|
      if @flu_mortality2016.save
        format.html { redirect_to @flu_mortality2016, notice: 'Flu mortality2016 was successfully created.' }
        format.json { render :show, status: :created, location: @flu_mortality2016 }
      else
        format.html { render :new }
        format.json { render json: @flu_mortality2016.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flu_mortality2016s/1
  # PATCH/PUT /flu_mortality2016s/1.json
  def update
    respond_to do |format|
      if @flu_mortality2016.update(flu_mortality2016_params)
        format.html { redirect_to @flu_mortality2016, notice: 'Flu mortality2016 was successfully updated.' }
        format.json { render :show, status: :ok, location: @flu_mortality2016 }
      else
        format.html { render :edit }
        format.json { render json: @flu_mortality2016.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flu_mortality2016s/1
  # DELETE /flu_mortality2016s/1.json
  def destroy
    @flu_mortality2016.destroy
    respond_to do |format|
      format.html { redirect_to flu_mortality2016s_url, notice: 'Flu mortality2016 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flu_mortality2016
      @flu_mortality2016 = FluMortality2016.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flu_mortality2016_params
      params.require(:flu_mortality2016).permit(:state_id, :deaths, :filter_id)
    end
end
