class Recrutamento < ApplicationRecord
  def name
    nome
  end
  enum estado: ["Processo Aberto", "Processo Encerrado", "Processo Arquivado"]
  has_and_belongs_to_many :talentos
  belongs_to :quartel
  belongs_to :admin_user

  validates :nome, presence: true
  #validates :inicio, presence: true
  validates :o_que_procura, presence: true
  validates :estado, presence: true
  validates :talentos, presence: true
end
