class Cargoocupado < ApplicationRecord
  def name
    titulo
  end
  has_and_belongs_to_many :talentos
  validates :titulo, presence: true
end
