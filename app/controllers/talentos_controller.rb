class TalentosController < ApplicationController
  before_action :set_talento, only: [:show, :edit, :update, :destroy]

  def confirm_email
    talento = Talento.find_by_confirm_token(params[:id])
    if talento
      talento.email_activate
      flash[:success] = "Você confirmou que concorda com as Políticas de Privacidade deste Banco de Talentos. Em breve seu perfil aparecerá aos recrutadores das empresas parceiras. Boa sorte!"
      redirect_to root_url
    else
      flash[:error] = "Desculpe. Perfil de Talento não encontrado. Converse com sua OM para registrar seu perfil em nosso Banco de Talentos ou para realizar a ativação manual de nossa política de privacidade junto ao administrador do sistema."
      redirect_to root_url
    end
  end
  # GET /talentos
  # GET /talentos.json
  def index
    @talentos = Talento.all
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
    respond_to do |format|
      if @talento.save
        TalentoMailer.confirmacao_politica_privacidade(@talento).deliver
        format.html { redirect_to @talento, notice: 'Novo Talento foi criado com sucesso!' }
        format.json { render :show, status: :created, location: @talento }
      else
        format.html { render :new}
        format.json { render json: @talento.errors, status: :unprocessable_entity }
        #flash.now[:error] = "Há erros de preenchimento a serem corrigidos. Por favor confira os campos, siga as instruções de correção e #tente de novo."
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
