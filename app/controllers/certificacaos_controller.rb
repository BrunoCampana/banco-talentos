class CertificacaosController < ApplicationController
  before_action :set_certificacao, only: [:show, :edit, :update, :destroy]

  # GET /certificacaos
  # GET /certificacaos.json
  def index
    @certificacaos = Certificacao.all
  end

  # GET /certificacaos/1
  # GET /certificacaos/1.json
  def show
  end

  # GET /certificacaos/new
  def new
    @certificacao = Certificacao.new
  end

  # GET /certificacaos/1/edit
  def edit
  end

  # POST /certificacaos
  # POST /certificacaos.json
  def create
    @certificacao = Certificacao.new(certificacao_params)

    respond_to do |format|
      if @certificacao.save
        format.html { redirect_to @certificacao, notice: 'Certificacao was successfully created.' }
        format.json { render :show, status: :created, location: @certificacao }
      else
        format.html { render :new }
        format.json { render json: @certificacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /certificacaos/1
  # PATCH/PUT /certificacaos/1.json
  def update
    respond_to do |format|
      if @certificacao.update(certificacao_params)
        format.html { redirect_to @certificacao, notice: 'Certificacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @certificacao }
      else
        format.html { render :edit }
        format.json { render json: @certificacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /certificacaos/1
  # DELETE /certificacaos/1.json
  def destroy
    @certificacao.destroy
    respond_to do |format|
      format.html { redirect_to certificacaos_url, notice: 'Certificacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certificacao
      @certificacao = Certificacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def certificacao_params
      params.fetch(:certificacao, {})
    end
end
