class Talento < ApplicationRecord
  has_paper_trail
  before_create :confirmation_token
  def name
    ndg
  end
  enum genero: ["Masculino", "Feminino", "Outros"]
  enum estado_civil: ["Solteiro", "Casado", "Separado", "Divorciado", "Viúvo", "Não informado"]
  enum pcd: [" Não ", " Sim "]
  enum hierarquia: ["Soldado do Efetivo Variável (ano do serviço militar obrigatório)", "Soldado Efetivo Profissional", "Cabo", "3º Sargento", "Aspirante-a-Oficial", "2º Tenente", "1º Tenente"]
  enum disponibilidade: ["Qualquer uma", "Integral trabalhando final de semana", "Integral sem trabalhar finais de semana", "Noturna", "Madrugada", "Não informado "]
  enum viajar: ["Sim ", "Não "]
  enum mudar: ["Viável", "Inviável"]

  has_and_belongs_to_many :recrutamentos
  has_and_belongs_to_many :areaatuacaos
  has_and_belongs_to_many :cargoocupados
  has_and_belongs_to_many :certificacaos
  has_and_belongs_to_many :cursos
  has_and_belongs_to_many :formacaoacads
  belongs_to :formmilitar
  has_and_belongs_to_many :habilidades
  has_and_belongs_to_many :cnhs
  has_and_belongs_to_many :atributoafetivos
  has_and_belongs_to_many :idiomas
  belongs_to :quartel
  belongs_to :cidade

  has_attached_file :foto, :styles => { :medium => "238x238>", :thumb => "200x200>"}
  validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

  has_attached_file :consentimento

  accepts_nested_attributes_for :cargoocupados, allow_destroy: true
  accepts_nested_attributes_for :certificacaos, allow_destroy: true
  accepts_nested_attributes_for :cursos, allow_destroy: true
  accepts_nested_attributes_for :formacaoacads, allow_destroy: true

  def analisado_pelo_cmt
    self.aval_cmt
  end

  def idade
    if self.nascimento != nil
      if ((Time.now.month>=self.nascimento.month)and(Time.now.day>=self.nascimento.day))
        idade = (Time.now.year - self.nascimento.year).to_s + ' anos'
      else
        idade = ((Time.now.year - self.nascimento.year).to_i - 1).to_s + ' anos'
      end
    end
  end

  def tmp_sv_militar
    if self.data_praca != nil and self.data_desligamento != nil
      if (self.data_desligamento.month >= self.data_praca.month)
        tmp_sv_militar = ((Time.now.year - self.data_praca.year).to_i + 1).to_s + ' anos'
      else
        tmp_sv_militar = (Time.now.year - self.data_praca.year).to_s + ' anos'
      end
    elsif self.data_praca != nil
      if (Time.now.month >= self.data_praca.month)
        tmp_sv_militar = ((Time.now.year - self.data_praca.year).to_i + 1).to_s + ' anos'
      else
        tmp_sv_militar = (Time.now.year - self.data_praca.year).to_s + ' anos'
      end
    end
  end

  def email_activate
    self.update(email_confirmed:  "true")
    self.update(confirm_token: nil)
  end

  validates :nome_completo, presence: true
  validates :email, presence: true
  validates :celular, presence: true
  validates :ndg, presence: true
  validates :genero, presence: true
  validates :pcd, presence: true
  validates :hierarquia, presence: true
  validates :disponibilidade, presence: true
  validates :viajar, presence: true
  validates :mudar, presence: true
  validates :cpf, presence: true, length: { is: 11, message: "CPF inválido. CPF deverá conter apenas e unicamente 11 dígitos"}, format: { with: /\A[0-9]+\z/, message: "CPF inválido. CPF deverá conter apenas os 11 dígitos"}, uniqueness: {message: "CPF já encontra-se cadastrado em nossa base de dados"}
  #validates :cpf, presence: true, numericality: { only_integer: true, greater_than: 9999999999, less_than: 99999999999, message: "CPF #inválido"}, uniqueness: {message: "CPF já encontra-se cadastrado em nossa base de dados"}
  validates :atributoafetivos, length: {maximum: 3, message: "Deverão ser marcadas no máximo 3 atributos da área afetiva"}
  #validates :quartel, presence: true, if: :mesmaom?
  #validates :consentimento, presence: true
  validates :nome_referencia, presence: true
  validates :cel_referencia, presence: true
  validates :email_referencia, presence: true

  #def mesmaom?
  #  self.quartel == currm.admin_user.quartel
  #end
  private
  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
