class AreaatuacaosController < ApplicationController
  before_action :set_areaatuacao, only: [:show, :edit, :update, :destroy]

  # GET /areaatuacaos
  # GET /areaatuacaos.json
  def index
    @areaatuacaos = Areaatuacao.all
  end

  # GET /areaatuacaos/1
  # GET /areaatuacaos/1.json
  def show
  end

  # GET /areaatuacaos/new
  def new
    @areaatuacao = Areaatuacao.new
  end

  # GET /areaatuacaos/1/edit
  def edit
  end

  # POST /areaatuacaos
  # POST /areaatuacaos.json
  def create
    @areaatuacao = Areaatuacao.new(areaatuacao_params)

    respond_to do |format|
      if @areaatuacao.save
        format.html { redirect_to @areaatuacao, notice: 'Areaatuacao was successfully created.' }
        format.json { render :show, status: :created, location: @areaatuacao }
      else
        format.html { render :new }
        format.json { render json: @areaatuacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /areaatuacaos/1
  # PATCH/PUT /areaatuacaos/1.json
  def update
    respond_to do |format|
      if @areaatuacao.update(areaatuacao_params)
        format.html { redirect_to @areaatuacao, notice: 'Areaatuacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @areaatuacao }
      else
        format.html { render :edit }
        format.json { render json: @areaatuacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /areaatuacaos/1
  # DELETE /areaatuacaos/1.json
  def destroy
    @areaatuacao.destroy
    respond_to do |format|
      format.html { redirect_to areaatuacaos_url, notice: 'Areaatuacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_areaatuacao
      @areaatuacao = Areaatuacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def areaatuacao_params
      params.fetch(:areaatuacao, {})
    end
end
