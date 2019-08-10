class Cargoocupado < ApplicationRecord
  def name
    titulo
  end
  belongs_to :talento
end
