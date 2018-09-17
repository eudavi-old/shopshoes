class Funcionario < ApplicationRecord
	has_and_belongs_to_many :cargos
	has_and_belongs_to_many :setors
	has_many :emails, :dependent => :destroy
	has_many :telefones, :dependent => :destroy
	belongs_to :user

	accepts_nested_attributes_for :emails, allow_destroy: true
	accepts_nested_attributes_for :telefones, allow_destroy: true
end
