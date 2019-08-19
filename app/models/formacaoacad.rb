class Formacaoacad < ApplicationRecord
  def name
    titulo
  end

  has_and_belongs_to_many :talento
  validates :titulo, presence: true
end
