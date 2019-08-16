class Formacaoacad < ApplicationRecord
  def name
    titulo
  end
  enum nivel: ["Fundamental", "Médio", "Médio - Técnico", "Superior - Tecnólogo", "Superior - Bacharelado", "Superior - Licenciatura", "Superior", "Especialização (pós-grad lato sensu)", "MBA (pós-grad lato sensu)", "Mestrado (pós-grad stricto sensu)", "Doutorado (pós-grad stricto sensu)"]
  belongs_to :talento
  validates :titulo, presence: true
end
