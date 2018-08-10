class Funcionario < ApplicationRecord
	has_and_belongs_to_many :cargos
	has_and_belongs_to_many :setors
	has_many :emails, :dependent => :destroy

	accepts_nested_attributes_for :emails, allow_destroy: true
end
