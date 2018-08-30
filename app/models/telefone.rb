class Telefone < ApplicationRecord
	belongs_to :funcionario
	accepts_nested_attributes_for :emails, allow_destroy: true
end
