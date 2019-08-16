class Cidade < ApplicationRecord
  def name
    nome
  end
  has_many :talentos
  validates :nome, presence: true
end
