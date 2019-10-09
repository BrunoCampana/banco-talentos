class RecrutamentosController < InheritedResources::Base

  before_action :set_recrutamento, only: [:show, :edit, :update, :destroy]

  # GET /talentos
  # GET /talentos.json
  def index
    @recrutamento = Recrutamento.all
  end

  # GET /talentos/1
  # GET /talentos/1.json
  def show
  end

  # GET /talentos/new
  def new
    @recrutamento = Recrutamento.new
  end

  # GET /talentos/1/edit
  def edit
  end

  # POST /talentos
  # POST /talentos.json
  def create
    @recrutamento = Recrutamento.new(recrutamento_params)
    respond_to do |format|
      if @recrutamento.save
        format.html { redirect_to @recrutamento, notice: 'Processo de Recrutamento was successfully created.' }
        format.json { render :show, status: :created, location: @recrutamento }
      else
        format.html { render :new }
        format.json { render json: @recrutamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /talentos/1
  # PATCH/PUT /talentos/1.json
  def update
    respond_to do |format|
      if @recrutamento.update(recrutamento_params)
        format.html { redirect_to @recrutamento, notice: 'Processo de Recrutamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @recrutamento }
      else
        format.html { render :edit }
        format.json { render json: @recrutamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talentos/1
  # DELETE /talentos/1.json
  def destroy
    @recrutamento.destroy
    respond_to do |format|
      format.html { redirect_to talentos_url, notice: 'Processo de Recrutamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recrutamento
      @recrutamento = Recrutamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recrutamento_params
      params.fetch(:recrutamento, {})
    end
  private

    def recrutamento_params
      params.require(:recrutamento).permit()
    end

end
