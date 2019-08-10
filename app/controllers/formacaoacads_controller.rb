class FormacaoacadsController < ApplicationController
  before_action :set_formacaoacad, only: [:show, :edit, :update, :destroy]

  # GET /formacaoacads
  # GET /formacaoacads.json
  def index
    @formacaoacads = Formacaoacad.all
  end

  # GET /formacaoacads/1
  # GET /formacaoacads/1.json
  def show
  end

  # GET /formacaoacads/new
  def new
    @formacaoacad = Formacaoacad.new
  end

  # GET /formacaoacads/1/edit
  def edit
  end

  # POST /formacaoacads
  # POST /formacaoacads.json
  def create
    @formacaoacad = Formacaoacad.new(formacaoacad_params)

    respond_to do |format|
      if @formacaoacad.save
        format.html { redirect_to @formacaoacad, notice: 'Formacaoacad was successfully created.' }
        format.json { render :show, status: :created, location: @formacaoacad }
      else
        format.html { render :new }
        format.json { render json: @formacaoacad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formacaoacads/1
  # PATCH/PUT /formacaoacads/1.json
  def update
    respond_to do |format|
      if @formacaoacad.update(formacaoacad_params)
        format.html { redirect_to @formacaoacad, notice: 'Formacaoacad was successfully updated.' }
        format.json { render :show, status: :ok, location: @formacaoacad }
      else
        format.html { render :edit }
        format.json { render json: @formacaoacad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formacaoacads/1
  # DELETE /formacaoacads/1.json
  def destroy
    @formacaoacad.destroy
    respond_to do |format|
      format.html { redirect_to formacaoacads_url, notice: 'Formacaoacad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formacaoacad
      @formacaoacad = Formacaoacad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formacaoacad_params
      params.fetch(:formacaoacad, {})
    end
end
