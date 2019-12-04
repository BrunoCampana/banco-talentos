class Quartel < ApplicationRecord
  def name
    nome
  end
  has_many :talentos
  has_many :recrutamentos
  has_many :admin_users
  validates :nome, presence: true
  enum tipo: ["OM", "Empresa", "Órgão Público"]

  def quantos_perfis_da_om?
    talentos.count
  end
end
