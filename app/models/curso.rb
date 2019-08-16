class Curso < ApplicationRecord
  def name
    titulo
  end
  enum modalidade: ["À distância", "Presencial"]
  belongs_to :talento
  validates :titulo, presence: true
end
