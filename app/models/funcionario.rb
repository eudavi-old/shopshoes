class Funcionario < ApplicationRecord
	has_and_belongs_to_many :cargos
	has_and_belongs_to_many :setores, class_name: "Setor"
	has_many :telefones, :dependent => :destroy

	has_one :user
	accepts_nested_attributes_for :telefones, allow_destroy: true
end
