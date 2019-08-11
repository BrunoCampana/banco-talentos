class Talento < ApplicationRecord
  def name
    nome_completo
  end
  enum genero: ["Masculino", "Feminino", "Prefiro não declarar"]
  enum estado_civil: ["Solteiro", "Casado", "Separado", "Divorciado", "Viúvo", "Não informado"]
  enum pcd: ["Não", "Sim"]
  enum status_atual: ["Empregado no EB", "Desempregado", "Empregado fora do EB"]
  enum hierarquia: ["Recruta", "Sd", "Cb", "3º Sgt", "Asp Of", "2º Ten", "1º Ten"]
  enum assiduidade: ["Não observado", "Ruim", "Mediano", "Acima da média"]
  enum pontualidade: [" Não observado", " Ruim", " Mediano", " Acima da média"]
  enum disciplina: ["Não observado ", "Ruim ", "Mediano ", "Acima da média "]
  enum lideranca: [" Não observado ", " Ruim ", " Mediano ", " Acima da média "]
  enum apresentacao: ["  Não observado", "  Ruim", "  Mediano", "  Acima da média"]
  enum dedicacao: ["Não observado  ", "Ruim  ", "Mediano  ", "Acima da média  "]
  enum iniciativa: [" Não observado  ", " Ruim  ", " Mediano  ", " Acima da média  "]
  enum produtividade: ["  Não observado ", "  Ruim ", "  Mediano ", "  Acima da média "]
  enum comunicacao: ["  Não observado  ", "  Ruim  ", "  Mediano  ", "  Acima da média  "]
  enum estab_emocional: ["   Não observado", "   Ruim", "   Mediano", "   Acima da média"]
  enum resistencia_fisica: ["Não observado   ", "Ruim   ", "Mediano   ", "Acima da média   "]
  enum disponibilidade: ["Qualquer uma", "Integral trabalhando final de semana", "Integral sem trabalhar finais de semana", "Noturna", "Madrugada", "Não informado "]
  enum nivel_formacao_cargo: ["Qualquer um", "Médio comum", "Nível Técnico", "Superior"]
  enum viajar: ["Sim ", "Não ", "Talvez", "Não sei ", " Não informado"]
  enum mudar: ["Viável", "Inviável", "Talvez ", " Não sei ", " Não informado "]

  has_and_belongs_to_many :areaatuacaos
  has_many :cargoocupados, :dependent => :delete_all
  has_many :certificacaos, :dependent => :delete_all
  has_many :cursos, :dependent => :delete_all
  has_many :formacaoacads, :dependent => :delete_all
  belongs_to :formmilitar
  has_and_belongs_to_many :habilidades
  has_and_belongs_to_many :idiomas
  belongs_to :quartel
  belongs_to :cidade

  has_attached_file :foto, :styles => { :medium => "238x238>", :thumb => "200x200>"}
  validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

  accepts_nested_attributes_for :cargoocupados, allow_destroy: true
  accepts_nested_attributes_for :certificacaos, allow_destroy: true
  accepts_nested_attributes_for :cursos, allow_destroy: true
  accepts_nested_attributes_for :formacaoacads, allow_destroy: true

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
    if self.data_praca != nil
      if (Time.now.month >= self.data_praca.month)
        tmp_sv_militar = ((Time.now.year - self.data_praca.year).to_i + 1).to_s + ' anos'
      else
        tmp_sv_militar = (Time.now.year - self.data_praca.year).to_s + ' anos'
      end
    end
  end
end
