class User < ApplicationRecord
  
  belongs_to :cliente, optional: true
  belongs_to :funcionario, optional: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  delegate :manipular_cliente, to: :funcionario
  delegate :manipular_funcionario, to: :funcionario
  delegate :manipular_produto, to: :funcionario

  def is_admin?
  	self.admin?
  end
  
end
