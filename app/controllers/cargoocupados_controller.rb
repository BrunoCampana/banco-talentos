class CargoocupadosController < ApplicationController
  before_action :set_cargoocupado, only: [:show, :edit, :update, :destroy]

  # GET /cargoocupados
  # GET /cargoocupados.json
  def index
    @cargoocupados = Cargoocupado.all
  end

  # GET /cargoocupados/1
  # GET /cargoocupados/1.json
  def show
  end

  # GET /cargoocupados/new
  def new
    @cargoocupado = Cargoocupado.new
  end

  # GET /cargoocupados/1/edit
  def edit
  end

  # POST /cargoocupados
  # POST /cargoocupados.json
  def create
    @cargoocupado = Cargoocupado.new(cargoocupado_params)

    respond_to do |format|
      if @cargoocupado.save
        format.html { redirect_to @cargoocupado, notice: 'Cargoocupado was successfully created.' }
        format.json { render :show, status: :created, location: @cargoocupado }
      else
        format.html { render :new }
        format.json { render json: @cargoocupado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cargoocupados/1
  # PATCH/PUT /cargoocupados/1.json
  def update
    respond_to do |format|
      if @cargoocupado.update(cargoocupado_params)
        format.html { redirect_to @cargoocupado, notice: 'Cargoocupado was successfully updated.' }
        format.json { render :show, status: :ok, location: @cargoocupado }
      else
        format.html { render :edit }
        format.json { render json: @cargoocupado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cargoocupados/1
  # DELETE /cargoocupados/1.json
  def destroy
    @cargoocupado.destroy
    respond_to do |format|
      format.html { redirect_to cargoocupados_url, notice: 'Cargoocupado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cargoocupado
      @cargoocupado = Cargoocupado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cargoocupado_params
      params.fetch(:cargoocupado, {})
    end
end
