class TalentosController < ApplicationController
  before_action :set_talento, only: [:show, :edit, :update, :destroy]

  # GET /talentos
  # GET /talentos.json
  def index
    if current_admin_user.admin?
      @talentos = Talento.all
    elsif current_admin_user.recrutador?
      @talentos = Talento.where(:aval_cmt => true)
    else
      @talentos = Talento.where(quartel_id==current_admin_user.quartel_id)
  end

  # GET /talentos/1
  # GET /talentos/1.json
  def show
  end

  # GET /talentos/new
  def new
    @talento = Talento.new
  end

  # GET /talentos/1/edit
  def edit
  end

  # POST /talentos
  # POST /talentos.json
  def create
    @talento = Talento.new(talento_params)
    @talento.quartel = current_admin_user.quartel
    respond_to do |format|
      if @talento.save
        format.html { redirect_to @talento, notice: 'Talento was successfully created.' }
        format.json { render :show, status: :created, location: @talento }
      else
        format.html { render :new }
        format.json { render json: @talento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /talentos/1
  # PATCH/PUT /talentos/1.json
  def update
    respond_to do |format|
      if @talento.update(talento_params)
        format.html { redirect_to @talento, notice: 'Talento was successfully updated.' }
        format.json { render :show, status: :ok, location: @talento }
      else
        format.html { render :edit }
        format.json { render json: @talento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talentos/1
  # DELETE /talentos/1.json
  def destroy
    @talento.destroy
    respond_to do |format|
      format.html { redirect_to talentos_url, notice: 'Talento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talento
      @talento = Talento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def talento_params
      params.fetch(:talento, {})
    end
end
