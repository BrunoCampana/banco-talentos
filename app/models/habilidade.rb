class Habilidade < ApplicationRecord
  def name
    titulo
  end
  has_and_belongs_to_many :talentos
  validates :titulo, presence: true

  def quantos_possuem?
    talentos.count
  end
end
