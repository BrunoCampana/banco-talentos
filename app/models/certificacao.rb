class Certificacao < ApplicationRecord
  def name
    titulo
  end
  belongs_to :talento
end
