class Setor < ApplicationRecord
	has_and_belongs_to_many :funcionarios

	self.table_name = "setores"
end
