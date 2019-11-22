class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :trackable, :lockable

  enum tipo: [:Administrador, :Comandante, :Cadastrador, :Recrutador]
  belongs_to :quartel
  has_many :recrutamentos

  def admin?
    self.tipo == 'Administrador'
  end

  def milico?
    self.tipo == 'Administrador' or 'Comandante' or 'Cadastrador'
  end

  def cmt?
    self.tipo == 'Comandante'
  end

  def recrutador?
    self.tipo == 'Recrutador'
  end

  def active_for_authentication?
    super && status == true
  end

  def name
    nome
  end

  validates :email, presence: true
  validates :nome, presence: true
  validates :cpf, presence: true, length: { is: 11, message: "CPF inválido. CPF deverá conter apenas e unicamente 11 dígitos"}, format: { with: /\A[0-9]+\z/, message: "CPF inválido. CPF deverá conter apenas os 11 dígitos"}, uniqueness: {message: "CPF já encontra-se cadastrado em nossa base de dados"}
  validates :teleone, presence: true
end
