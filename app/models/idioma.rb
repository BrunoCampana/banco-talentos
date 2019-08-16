class Idioma < ApplicationRecord
  def name
    lingua_nivel
  end
  has_and_belongs_to_many :talentos
  validates :lingua_nivel, presence: true
end
