class Funcionario < ApplicationRecord
	has_and_belongs_to_many :cargos
	has_and_belongs_to_many :setores, class_name: "Setor"
	has_many :telefones, :dependent => :destroy

	has_one :user
	accepts_nested_attributes_for :telefones, allow_destroy: true

	def manipular_cliente(numero_setor)
		self.setores[setor].manipular_cliente
	end

	def manipular_funcionario(numero_setor)
		self.setores[setor].manipular_funcionario
	end

	def manipular_produto(numero_setor)
		self.setores[setor].manipular_funcionario
	end
end
