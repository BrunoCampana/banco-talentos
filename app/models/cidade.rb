class Cidade < ApplicationRecord
  def name
    nome
  end
  has_many :talentos
  validates :nome, presence: true

  def quantos_perfis_na_cidade?
    talentos.count
  end
end
