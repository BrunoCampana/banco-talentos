class Habilidade < ApplicationRecord
  def name
    titulo
  end
  has_and_belongs_to_many :talentos
end
