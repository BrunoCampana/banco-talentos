class FormmilitarsController < ApplicationController
  before_action :set_formmilitar, only: [:show, :edit, :update, :destroy]

  # GET /formmilitars
  # GET /formmilitars.json
  def index
    @formmilitars = Formmilitar.all
  end

  # GET /formmilitars/1
  # GET /formmilitars/1.json
  def show
  end

  # GET /formmilitars/new
  def new
    @formmilitar = Formmilitar.new
  end

  # GET /formmilitars/1/edit
  def edit
  end

  # POST /formmilitars
  # POST /formmilitars.json
  def create
    @formmilitar = Formmilitar.new(formmilitar_params)

    respond_to do |format|
      if @formmilitar.save
        format.html { redirect_to @formmilitar, notice: 'Formmilitar was successfully created.' }
        format.json { render :show, status: :created, location: @formmilitar }
      else
        format.html { render :new }
        format.json { render json: @formmilitar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formmilitars/1
  # PATCH/PUT /formmilitars/1.json
  def update
    respond_to do |format|
      if @formmilitar.update(formmilitar_params)
        format.html { redirect_to @formmilitar, notice: 'Formmilitar was successfully updated.' }
        format.json { render :show, status: :ok, location: @formmilitar }
      else
        format.html { render :edit }
        format.json { render json: @formmilitar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formmilitars/1
  # DELETE /formmilitars/1.json
  def destroy
    @formmilitar.destroy
    respond_to do |format|
      format.html { redirect_to formmilitars_url, notice: 'Formmilitar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formmilitar
      @formmilitar = Formmilitar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formmilitar_params
      params.fetch(:formmilitar, {})
    end
end
