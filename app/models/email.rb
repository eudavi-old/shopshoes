class Email < ApplicationRecord
	belongs_to :funcionario
	belongs_to :cliente
end
