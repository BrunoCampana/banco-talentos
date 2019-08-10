class QuartelsController < ApplicationController
  before_action :set_quartel, only: [:show, :edit, :update, :destroy]

  # GET /quartels
  # GET /quartels.json
  def index
    @quartels = Quartel.all
  end

  # GET /quartels/1
  # GET /quartels/1.json
  def show
  end

  # GET /quartels/new
  def new
    @quartel = Quartel.new
  end

  # GET /quartels/1/edit
  def edit
  end

  # POST /quartels
  # POST /quartels.json
  def create
    @quartel = Quartel.new(quartel_params)

    respond_to do |format|
      if @quartel.save
        format.html { redirect_to @quartel, notice: 'Quartel was successfully created.' }
        format.json { render :show, status: :created, location: @quartel }
      else
        format.html { render :new }
        format.json { render json: @quartel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quartels/1
  # PATCH/PUT /quartels/1.json
  def update
    respond_to do |format|
      if @quartel.update(quartel_params)
        format.html { redirect_to @quartel, notice: 'Quartel was successfully updated.' }
        format.json { render :show, status: :ok, location: @quartel }
      else
        format.html { render :edit }
        format.json { render json: @quartel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quartels/1
  # DELETE /quartels/1.json
  def destroy
    @quartel.destroy
    respond_to do |format|
      format.html { redirect_to quartels_url, notice: 'Quartel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quartel
      @quartel = Quartel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quartel_params
      params.fetch(:quartel, {})
    end
end
