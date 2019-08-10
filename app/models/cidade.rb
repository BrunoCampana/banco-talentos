class Cidade < ApplicationRecord
  def name
    nome
  end
  has_many :talentos
end
