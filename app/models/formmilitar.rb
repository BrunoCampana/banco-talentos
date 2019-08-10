class Formmilitar < ApplicationRecord
  def name
    titulo
  end
  has_many :talentos
end
