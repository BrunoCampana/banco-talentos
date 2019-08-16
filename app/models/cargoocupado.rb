class Cargoocupado < ApplicationRecord
  def name
    titulo
  end
  belongs_to :talento
  validates :titulo, presence: true
end
