class Talento < ApplicationRecord
  def name
    ndg
  end
  enum genero: ["Masculino", "Feminino", "Prefiro não declarar"]
  enum estado_civil: ["Solteiro", "Casado", "Separado", "Divorciado", "Viúvo", "Não informado"]
  enum pcd: [" Não ", " Sim "]
  enum hierarquia: ["Soldado do Efetivo Variável (ano do serviço militar obrigatório)", "Soldado Efetivo Profissional", "Cabo", "3º Sargento", "Aspirante-a-Oficial", "2º Tenente", "1º Tenente"]
  enum disponibilidade: ["Qualquer uma", "Integral trabalhando final de semana", "Integral sem trabalhar finais de semana", "Noturna", "Madrugada", "Não informado "]
  enum viajar: ["Sim ", "Não ", "Talvez", "Não sei ", " Não informado"]
  enum mudar: ["Viável", "Inviável", "Talvez ", " Não sei ", " Não informado "]

  has_and_belongs_to_many :areaatuacaos
  has_many :cargoocupados, :dependent => :delete_all
  has_many :certificacaos, :dependent => :delete_all
  has_many :cursos, :dependent => :delete_all
  has_many :formacaoacads, :dependent => :delete_all
  belongs_to :formmilitar
  has_and_belongs_to_many :habilidades
  has_and_belongs_to_many :cnhs
  has_and_belongs_to_many :atributoafetivos
  has_and_belongs_to_many :idiomas
  belongs_to :quartel
  belongs_to :cidade

  has_attached_file :foto, :styles => { :medium => "238x238>", :thumb => "200x200>"}
  validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

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
end
