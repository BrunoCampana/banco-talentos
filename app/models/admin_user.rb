class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  enum tipo: ["Administrador", "Cadastrador de talentos", "Recrutador de talentos"]
  enum status: ["Inativo", "Ativo"]
  belongs_to :quartel

  def admin?
    self.tipo == "Administrador"
  end

  def active_for_authentication?
    super && status == "Ativo"
  end

  def name
    nome
  end
end
