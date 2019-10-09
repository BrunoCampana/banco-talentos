class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  enum tipo: [:Admin, :CmtOM, :Cadastrador, :Recrutador]
  enum status: ["Inativo", "Ativo"]
  belongs_to :quartel
  has_many :recrutamentos

  def admin?
    self.tipo == 'Admin'
  end

  def milico?
    self.tipo == 'Admin' or 'CmtOM' or 'Cadastrador'
  end

  def cmt?
    self.tipo == 'CmtOM'
  end

  def recrutador?
    self.tipo == 'Recrutador'
  end

  def active_for_authentication?
    super && status == "Ativo"
  end

  def name
    nome
  end

  validates :email, presence: true
  validates :nome, presence: true
  validates :cpf, presence: true, length: { is: 11, message: "CPF inválido. CPF deverá conter apenas e unicamente 11 dígitos"}, format: { with: /\A[0-9]+\z/, message: "CPF inválido. CPF deverá conter apenas os 11 dígitos"}, uniqueness: {message: "CPF já encontra-se cadastrado em nossa base de dados"}
  validates :teleone, presence: true
end
